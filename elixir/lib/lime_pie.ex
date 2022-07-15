defmodule LimePie do
  @moduledoc """
  Easy to use library to encrypt and decrypt domain events.
  """

  @type named_key :: %LimePie.KeyLime{}
  @type domain_event :: map()
  @type named_keys :: %{binary() => named_key()}
  @type path_to_pii :: [atom()]
  @type paths_to_pii :: [path_to_pii]
  @type converted_values :: list({[binary], any()})

  @spec encrypt_domain_event(domain_event(), named_key()) ::
          {:ok, domain_event()} | {:error, atom()}
  def encrypt_domain_event(domain_event, named_key) do
    with {:ok, paths_to_pii} <- paths_to_personally_identifiable_information(domain_event),
         {:ok, encrypted_values} <-
           map_values(paths_to_pii, domain_event, &encrypt_value(&1, named_key)) do
      {:ok, domain_event |> replace_values(encrypted_values)}
    else
      {:error, :mapping_values_failed, _path_to_pii} -> :FIXME
    end
  end

  @spec encrypt_domain_event(domain_event(), named_keys(), fail_quietly :: boolean()) ::
          {:ok, domain_event()} | {:error, atom()}
  def decrypt_domain_event(event, named_keys, fail_quietly \\ false)

  def decrypt_domain_event(event, named_keys, false) do
    with {:ok, paths_to_pii} <- paths_to_personally_identifiable_information(domain_event),
         {:ok, decrypted_values} <-
           map_values(paths_to_pii, domain_event, &decrypt_value(&1, named_keys)) do
      {:ok, domain_event |> replace_values(decrypted_values)}
    end
  end

  def decrypt_domain_event(event, named_keys, true) do
    case decrypt_domain_event(event, named_keys, false) do
      {:ok, event_with_decrypted_values} -> {:ok, event_with_decrypted_values}
      {:error, _some_error} -> {:ok, event}
    end
  end

  @spec map_values(
          paths_to_pii(),
          domain_event(),
          map_function :: (any() -> {:ok, any()} | {:error, atom(), any()})
        ) ::
          {:ok, converted_values()} | {:error, :mapping_values_failed, map()}
  def map_values([], _domain_event, _map_function), do: {:ok, []}

  def map_values(paths_to_pii, domain_event, map_function) do
    result =
      paths_to_pii
      |> Enum.map(fn path_to_pii ->
        case domain_event |> get_in(path_to_pii) |> map_function.() do
          {:ok, value} ->
            {:ok, path_to_pii, value}

          {:error, what, context} ->
            {:error, what, context |> Keyword.put(:path_to_pii, path_to_pii)}
        end
      end)
      |> Enum.group_by(&elem(&1, 0), fn {_atom, path_to_pii, value} -> {path_to_pii, value} end)

    if result |> Map.has_key?(:error) do
      {:error, :mapping_values_failed, result[:error]}
    else
      {:ok, result[:ok]}
    end
  end

  @spec replace_values(domain_event(), list({path_to_pii(), any()})) :: domain_event()
  def replace_values(domain_event, paths_with_values_to_pii) do
    paths_with_values_to_pii
    |> Enum.reduce(domain_event, fn {path_to_pii, value}, domain_event ->
      put_in(domain_event, path_to_pii, value)
    end)
  end

  @spec encrypt_value(value :: binary(), named_key()) ::
          {:ok, map()} | {:error, atom(), keyword()}
  def encrypt_value(value, named_key) do
    aad = named_key.name

    {:ok, {iv, encrypted_data, tag}} =
      value
      |> Jason.encode!()
      |> LimePie.SymmetricEncryption.encrypt(named_key.key, aad)

    {:ok,
     %{
       ciphertext: Base.encode64(encrypted_data),
       aad: aad,
       iv: Base.encode64(iv),
       tag: Base.encode64(tag)
     }}
  end

  @spec decrypt_value(any(), named_keys()) ::
          {:ok, binary() | map()} | {:error, atom(), keyword()}
  def decrypt_value(%{aad: key_name, iv: iv, tag: tag, ciphertext: ciphertext}, named_keys) do
    with {:ok, named_key} <- named_keys |> Map.fetch(key_name),
         {:ok, decrypted_string} <-
           LimePie.SymmetricEncryption.decrypt(
             ciphertext |> Base.decode64!(),
             named_key.key,
             iv |> Base.decode64!(),
             tag |> Base.decode64!(),
             key_name
           ),
         {:ok, decoded_value} <-
           Jason.decode(decrypted_string) do
      {:ok, decoded_value}
    else
      :error ->
        {:error, :unknown_key, missing_key_name: key_name}

      {:error, atom} when is_atom(atom) ->
        {:error, atom, []}

      {:error, %Jason.DecodeError{} = e} ->
        {:error, :jason_decoding_failed, exception: e}
    end
  end

  def decrypt_value(value, _named_keys), do: {:error, :value_is_not_encrypted, value}

  @spec paths_to_personally_identifiable_information(domain_event()) :: {:ok, paths_to_pii()}
  def paths_to_personally_identifiable_information(%{pii: data_owners_with_paths_to_pii})
      when is_map(data_owners_with_paths_to_pii) do
    {:ok,
     data_owners_with_paths_to_pii
     |> Enum.flat_map(fn {_data_owner, paths_to_pii} ->
       paths_to_pii
     end)
     |> Enum.uniq()
     |> Enum.map(fn path_to_pii ->
       path_to_pii
       # split by dots
       |> String.split(~r/\./)
       # drop the "$." at the beginning
       |> Enum.drop(1)
       # use atoms, not string
       |> Enum.map(&String.to_atom/1)
     end)}
  end

  def paths_to_personally_identifiable_information(_domain_event), do: {:ok, []}
end

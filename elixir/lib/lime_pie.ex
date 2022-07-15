defmodule LimePie do
  @moduledoc """
  Easy to use library to encrypt and decrypt domain events.
  """

  @type named_key :: %LimePie.KeyLime{}
  @type domain_event :: map
  @type named_keys :: %{binary => named_key}
  @type key_path :: [atom]
  @type key_paths :: [key_path]
  @type converted_values :: list({[binary], term})

  @spec encrypt_domain_event(domain_event, named_key) :: {:ok, domain_event} | {:error, atom}
  def(encrypt_domain_event(event, named_key)) do
    with {:ok, key_paths} <- key_paths_to_encrypt(event),
         {:ok, encrypted_values} <-
           map_values(key_paths, event, &encrypt_value(&1, named_key)) do
      {:ok, event |> replace_values(encrypted_values)}
    else
      {:error, :mapping_values_failed, _key_path} -> :FIXME
    end
  end

  @spec encrypt_domain_event(domain_event, named_keys) :: {:ok, domain_event} | {:error, atom}
  def decrypt_domain_event(event, named_keys, fail_quietly \\ false)

  def decrypt_domain_event(event, named_keys, false) do
    with {:ok, key_paths} <- key_paths_to_encrypt(event),
         {:ok, decrypted_values} <-
           map_values(key_paths, event, &decrypt_value(&1, named_keys)) do
      {:ok, event |> replace_values(decrypted_values)}
    end
  end

  def decrypt_domain_event(event, named_keys, true) do
    case decrypt_domain_event(event, named_keys, false) do
      {:ok, event_with_decrypted_values} -> {:ok, event_with_decrypted_values}
      {:error, _some_error} -> {:ok, event}
    end
  end

  @spec map_values(
          key_paths :: [[atom()]],
          event :: map,
          convert :: (any -> {:ok, any()} | {:error, atom, any})
        ) ::
          {:ok, converted_values} | {:error, :mapping_values_failed, map}
  def map_values([], _json_object, _map_function), do: {:ok, []}

  def map_values(key_paths, json_object, map_function) do
    result =
      key_paths
      |> Enum.map(fn key_path ->
        case json_object |> get_in(key_path) |> map_function.() do
          {:ok, value} -> {:ok, key_path, value}
          {:error, what, context} -> {:error, what, context |> Keyword.put(:key_path, key_path)}
        end
      end)
      |> Enum.group_by(&elem(&1, 0), fn {_atom, key_path, value} -> {key_path, value} end)

    if result |> Map.has_key?(:error) do
      {:error, :mapping_values_failed, result[:error]}
    else
      {:ok, result[:ok]}
    end
  end

  @spec replace_values(map, list({[binary], term})) :: map
  def replace_values(domain_event, key_paths_with_values) do
    key_paths_with_values
    |> Enum.reduce(domain_event, fn {key_path, value}, domain_event ->
      put_in(domain_event, key_path, value)
    end)
  end

  @spec encrypt_value(binary, named_key) :: {:ok, map} | {:error, atom, keyword()}
  def encrypt_value(json_value, named_key) do
    aad = named_key.name

    {:ok, {iv, encrypted_data, tag}} =
      json_value
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

  @spec decrypt_value(any, named_key) :: {:ok, binary | map} | {:error, atom, keyword()}
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

  @spec key_paths_to_encrypt(domain_event) :: {:ok, key_paths}
  def key_paths_to_encrypt(%{pii: data_owners_with_keys})
      when is_map(data_owners_with_keys) do
    {:ok,
     data_owners_with_keys
     |> Enum.flat_map(fn {_referenced_entity, protected_key_paths} ->
       protected_key_paths
     end)
     |> Enum.uniq()
     |> Enum.map(fn key_path ->
       key_path
       # split by dots
       |> String.split(~r/\./)
       # drop the "$." at the beginning
       |> Enum.drop(1)
       # use atoms, not string
       |> Enum.map(&String.to_atom/1)
     end)}
  end

  def key_paths_to_encrypt(_domain_event), do: {:ok, []}
end

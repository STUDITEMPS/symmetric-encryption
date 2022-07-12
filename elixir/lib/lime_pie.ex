defmodule LimePie do
  defmodule KeyLime do
    defstruct [:name, :key]

    def new(name) do
      %__MODULE__{key: :crypto.strong_rand_bytes(32), name: name}
    end

    def parse(name_and_encoded_key) do
      with [name, encoded_key] <- String.split(name_and_encoded_key, ~r/:/),
           {:ok, decoded_key} = encoded_key |> Base.decode64() do
        {:ok, %__MODULE__{name: name, key: decoded_key}}
      else
        [_name_only] ->
          {:error, :key_string_must_have_name_and_encoded_cipher}

        [_name, _encoded_key | _whatever] ->
          {:error, :key_string_must_have_only_name_and_encoded_cipher}

        :error ->
          {:error, :decoding_of_key_cipher_via_base_64_failed}
      end
    end
  end

  @type named_key :: %KeyLime{}
  @type domain_event :: %{}
  @type named_keys :: %{binary => named_key}
  @type key_paths :: [binary]

  @spec encrypt_domain_event(domain_event, named_key) :: {:ok, domain_event} | {:error, atom}
  def encrypt_domain_event(event, named_key) do
    with {:ok, key_paths} <- key_paths_to_encrypt(event),
         {:ok, encrypted_values} <-
           map_values(key_paths, event, &encrypt_value(&1, named_key)) do
      {:ok, event |> replace_values(encrypted_values)}
    else
      {:error, :missing_value, _key_path} -> :FIXME
    end
  end

  @spec encrypt_domain_event(domain_event, named_keys) :: {:ok, domain_event} | {:error, atom}
  def decrypt_domain_event(event, named_keys) do
    with {:ok, key_paths} <- key_paths_to_encrypt(event),
         {:ok, decrypted_values} <-
           map_values(key_paths, event, &decrypt_value(&1, named_keys)) do
      {:ok, event |> replace_values(decrypted_values)}
    else
      {:error, :missing_value, _key_path} -> :FIXME
    end
  end

  @spec map_values([binary], map, any :: {:ok, any} | {:error, atom}) ::
          {:ok, list({[binary], term})} | {:error, :mapping_values_failed, map}
  def map_values([], _json_object, _map_function), do: {:ok, []}

  def map_values(key_paths, json_object, map_function) do
    result =
      key_paths
      |> Enum.map(fn key_path ->
        case json_object |> get_in(key_path) |> map_function.() do
          {:ok, value} -> {:ok, key_path, value}
          {:error, value} -> {:error, key_path, value}
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

  @spec decrypt_value(map, named_key) :: {:ok, binary | map} | {:error, atom, keyword()}
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
        {:error, :unknown_key, name: key_name}

      {:error, %Jason.DecodeError{} = e} ->
        {:error, :jason_decoding_failed, exception: e}
    end
  end

  @spec key_paths_to_encrypt(domain_event) :: [key_paths]
  def key_paths_to_encrypt(%{pii: data_owners_with_keys})
      when is_map(data_owners_with_keys) do
    {:ok,
     data_owners_with_keys
     |> Enum.flat_map(fn {_referenced_entity, protected_key_paths} ->
       protected_key_paths
     end)
     |> Enum.uniq()
     |> Enum.map(fn key_path ->
       key_path |> String.split(~r/\./) |> Enum.drop(1) |> Enum.map(&String.to_atom/1)
     end)}
  end

  def key_paths_to_encrypt(_domain_event), do: {:ok, []}

  def fake_event do
    """
    {
      "@type": [
        "https://studitemps.tech/specification/anzeigenkunden/jobmensa-anzeige-geschaltet",
        "https://studitemps.tech/specification/domain-event"
      ],
      "@id": "tech.studitemps:anzeigenkunden:jobmensa-anzeige-geschaltet:7294e966-e293-428b-a3f0-001977588bd1",
      "pii": {
        "tech.studitemps:anzeigenkunden:unternehmen:cbd08a3f-4542-4d5e-8511-e3a192bb290d": [
          "$.schaltet_jobmensa_anzeige.bewerbungsziel",
          "$.schaltet_jobmensa_anzeige.einsatzort"
        ]
      },
      "schaltet_jobmensa_anzeige": {
        "stundenlohn": 1200,
        "einsatzort": {
          "strasse": "Hauptstraße",
          "hausnummer": "27",
          "plz": "30569",
          "ort": "Bad Foobar",
          "latitude": 5.4982374,
          "longitude": 32.3213127
        },
        "bewerbungsziel": "bewerbung@companygmbh.de",
        "typ_bewerbungsziel": "mail"
      }
    }

    """
    |> Jason.decode!()
  end
end

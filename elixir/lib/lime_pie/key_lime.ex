defmodule LimePie.KeyLime do
  @moduledoc """
  Encapsulates a LimePie Key with a name and a (secret) cipher
  """
  defstruct [:name, :key]

  @type t :: %__MODULE__{
          name: binary(),
          key: binary()
        }

  @spec new(binary) :: t()
  def new(name) do
    %__MODULE__{key: :crypto.strong_rand_bytes(32), name: name}
  end

  @spec parse(binary) ::
          {:ok, t()}
          | {:error,
             :decoding_of_key_cipher_via_base_64_failed
             | :key_string_must_have_name_and_encoded_cipher
             | :key_string_must_have_only_name_and_encoded_cipher}
  def parse(name_and_encoded_key) do
    with [name, encoded_key] <- String.split(name_and_encoded_key, ~r/:/),
         {:ok, decoded_key} <- encoded_key |> Base.decode64() do
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

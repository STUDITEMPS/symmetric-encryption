defmodule LimePie.KeyLime do
  @moduledoc """
  Encapsulates a LimePie Key with a name and a (secret) cipher
  """
  defstruct [:name, :key]

  require Logger

  defmodule ConfigError do
    defexception [:message]
  end

  @type t :: %__MODULE__{
          name: binary(),
          key: binary()
        }

  @doc ~S"""
    Creates a new random key with 32 bytes length with the given name.

    ## Examples
      iex> key_lime = LimePie.KeyLime.new("the_name")
      iex> %LimePie.KeyLime{name: "the_name"} = key_lime
      iex> key_lime.key |> String.length() >= 26
      true
  """
  @spec new(binary) :: t()
  def new(name) do
    %__MODULE__{key: :crypto.strong_rand_bytes(32), name: name}
  end

  @doc ~S"""
    Takes a string containing multiple named keys. Each named key must follow the format "name:key_in_base_64",
    and the named keys are concatenated by semicolons

    Returns a map with the name of the keys as, well, keys, and either the KeyLime structs as values
    or an error tuple

    ## Examples

      iex> LimePie.KeyLime.parse_multiple_keys(
      ...>   "first:y0mAP3Iu1ZnyV/KoVdTYPT0UQPleeCfu3aKCVt+oReQ=" <> ";" <>
      ...>   "second:5uWhvtkXq4CfOWJJGnPmnXSwvMlOzNvRMXCzCheITws=" <> ";" <>
      ...>   "third:bad_base_64")
      %{"first" => %LimePie.KeyLime{
          key: <<203, 73, 128, 63, 114, 46, 213, 153, 242, 87, 242, 168,  85, 212, 216, 61,
                 61, 20, 64, 249, 94, 120, 39, 238, 221, 162, 130, 86, 223, 168, 69, 228>>,
          name: "first"},
        "second" => %LimePie.KeyLime{
          key: <<230, 229, 161, 190, 217, 23, 171, 128, 159, 57, 98, 73, 26, 115, 230, 157,
                 116, 176, 188, 201, 78, 204, 219, 209, 49, 112, 179, 10, 23, 136, 79, 11>>,
          name: "second"},
        "third" => {:error, :decoding_of_key_cipher_via_base_64_failed}
      }

  """

  @spec parse_multiple_keys(binary) :: %{optional(binary) => t() | {:error, atom}}

  def parse_multiple_keys(""),
    do: raise(ConfigError, message: "Keys configuration is empty.")

  def parse_multiple_keys(binary) do
    binary
    |> String.split(~r/;/)
    |> Enum.map(&parse/1)
    |> Enum.map(fn
      {:ok, key_lime} ->
        {key_lime.name, key_lime}

      {:error, error, name} ->
        Logger.error("LimePie.KeyLime: Failed to parse key: #{name} with error: #{error}")
        {name, {:error, error}}
    end)
    |> Enum.into(%{})
  end

  @doc ~S"""
  Takes a string in format "name:key_in_base_64" and returns it as a struct.

  Fails with {:error, atom} if the string is not well formatted.any()

  ## Examples

    iex> LimePie.KeyLime.parse("first_name:y0mAP3Iu1ZnyV/KoVdTYPT0UQPleeCfu3aKCVt+oReQ=")
    {:ok, %LimePie.KeyLime{
      key: <<203, 73, 128, 63, 114, 46, 213, 153, 242, 87, 242, 168, 85, 212, 216,
        61, 61, 20, 64, 249, 94, 120, 39, 238, 221, 162, 130, 86, 223, 168, 69,
        228>>,
      name: "first_name"
    }}

    iex> LimePie.KeyLime.parse("first_name:not base 64 encoded")
    {:error, :decoding_of_key_cipher_via_base_64_failed, "first_name"}

    iex> LimePie.KeyLime.parse("name_only")
    {:error, :key_string_must_have_name_and_encoded_cipher, "name_only"}

    iex> LimePie.KeyLime.parse("name:some_key:more after the second colon")
    {:error, :key_string_must_have_only_name_and_encoded_cipher, "name"}
  """
  @spec parse(binary) ::
          {:ok, t()}
          | {:error, :atom, name_of_key :: binary | nil}
  def parse(name_and_encoded_key) do
    case String.split(name_and_encoded_key, ~r/:/) do
      [] ->
        {:error, :key_string_must_have_name_and_encoded_cipher, nil}

      [name_only] ->
        {:error, :key_string_must_have_name_and_encoded_cipher, name_only}

      [name, _encoded_key, _whatever] ->
        {:error, :key_string_must_have_only_name_and_encoded_cipher, name}

      [name, encoded_key] ->
        case encoded_key |> Base.decode64() do
          {:ok, decoded_key} -> {:ok, %__MODULE__{name: name, key: decoded_key}}
          _ -> {:error, :decoding_of_key_cipher_via_base_64_failed, name}
        end
    end
  end
end

defimpl String.Chars, for: LimePie.KeyLime do
  def to_string(%LimePie.KeyLime{name: name, key: key}) do
    "#{name |> String.replace(~r/:/, "_")}:#{key |> Base.encode64()}"
  end
end

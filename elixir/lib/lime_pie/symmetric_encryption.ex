defmodule LimePie.SymmetricEncryption do
  @moduledoc """
  Provides symmetric encryption and decryption using AES-256 in Galois Counter Mode.

  Provides a convenient encrypt/2 method that ensures that best practices are
  followed in using AES-256-GCM.

  We can use a single key for up to ~6 billion (6,074,001,001) encryptions until
  the likelihood of reusing an IV does not satisfy the uniqueness requirement of
  the NIST anymore.
  IV key length is strictly 96 bits, since otherwise we'd have to rotate the key
  after ~4.3 billion (2^32) invocations and the underlying GCM implementation
  has to spend extra CPU cycles for converting the IV to a 96 bit IV.

  The length of the returned authentication tag is 16 bytes and decryption only
  accepts tags of that length, since otherwise attackers could provide tags of 1
  byte length and their chance of correctly guessing the tag increases to 1/256.

  See
  https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38d.pdf
  for a detailed discussion and recommendations.
  """

  @tag_length 16

  @encrypt true
  @decrypt not @encrypt

  @doc """
  Encrypts binary data using a 256 bit key and a generated 96 bit initialization
  vector using AES-256-GCM.

  Returns `{:ok, {initialization_vector, encrypted_data, tag}}`.
  The initialization vector is required to decrypt the encrypted data. The tag
  is used to validate the authenticity of the encrypted data (authenticated
  encryption).

  ## Examples

    iex> key = :crypto.strong_rand_bytes(32)
    iex> result = "secret text" |> SymmetricEncryption.encrypt(key)
    iex> match?({:ok, {<<_::96>>, <<_::88>>, <<_::128>>}}, result)
    true
  """
  @spec encrypt(data :: binary(), key :: <<_::256>>, aad :: binary()) ::
          {:ok, {iv :: <<_::96>>, encrypted_data :: binary(), tag :: <<_::128>>}}
  def encrypt(data, key, authenticated_additional_data \\ "") do
    initialization_vector = :crypto.strong_rand_bytes(12)

    encrypt_with_iv(data, key, initialization_vector, authenticated_additional_data)
  end

  @doc """
  Encrypts binary data using a 256 bit key and a given initialization vector (IV) using AES-256-GCM. It is recommended that the IV is 96 bits long.

  **IMPORTANT: An IV must never be reused with the same key!**
  Reusing an IV-Key-Pair is catastrophic for AES-GCM, see
  https://csrc.nist.gov/csrc/media/projects/block-cipher-techniques/documents/bcm/comments/800-38-series-drafts/gcm/joux_comments.pdf

  Optionally accepts additional authenticated data (AAD) which is signed with
  the authentication key and can be verified during decryption. This AAD is
  *NOT* encrypted.

  Returns `{:ok, {initialization_vector, encrypted_data, tag}}`.
  The initialization vector is required to decrypt the encrypted data. The tag
  is used to validate the authenticity of the encrypted data (authenticated
  encryption).

  **NOTE**: Authenticated additional data (AAD) is required to be the same
  during encryption and decryption for decryption to succeed, i.e., when
  passing AAD to encrypt/4 make sure to also pass it to decrypt/5.

  ## Examples

    iex> key = :crypto.strong_rand_bytes(32)
    iex> iv = :crypto.strong_rand_bytes(12)
    iex> aad = "encrypted by Jim"
    iex> result = "secret text" |> SymmetricEncryption.encrypt_with_iv(key, iv, aad)
    iex> match?({:ok, {<<_::96>>, <<_::88>>, <<_::128>>}}, result)
    true
  """
  @spec encrypt_with_iv(data :: binary(), key :: <<_::256>>, iv :: binary(), aad :: binary()) ::
          {:ok, {iv :: <<_::96>>, encrypted_data :: binary(), tag :: <<_::128>>}}
  def encrypt_with_iv(data, key, initialization_vector, authenticated_additional_data) do
    {encrypted_data, tag} =
      :crypto.crypto_one_time_aead(
        :aes_256_gcm,
        key,
        initialization_vector,
        data,
        authenticated_additional_data,
        @tag_length,
        @encrypt
      )

    {:ok, {initialization_vector, encrypted_data, tag}}
  rescue
    error ->
      case error do
        %ErlangError{original: {:badarg, _c_file_info, message}} -> {:error, message}
        _ -> error |> inspect() |> IO.puts()
      end
  end

  @doc """
  Decrypts encrypted data with given key and initialization vector (IV) and
  validates authenticity of encrypted data and optionally additional data (AAD)
  using the provided tag.

  Accepts only tags of 128 bit length (16 bytes).

  **NOTE**: When authenticated additional data was passed during encryption it
  must also be included during decryption, otherwise decryption will fail.

  ## Examples

    iex> key = :crypto.strong_rand_bytes(32)
    iex> {:ok, {iv, encrypted_text, tag}} = "secret text" |> SymmetricEncryption.encrypt(key)
    iex> SymmetricEncryption.decrypt(encrypted_text, key, iv, tag)
    {:ok, "secret text"}
  """
  @spec decrypt(
          encrypted_data :: binary(),
          key :: <<_::256>>,
          iv :: binary(),
          tag :: <<_::128>>,
          aad :: binary()
        ) :: {:ok, data :: binary()} | {:error, :decrypt_failed} | {:error, :invalid_tag_length}
  def decrypt(
        encrypted_data,
        key,
        initialization_vector,
        tag,
        authenticated_additional_data \\ ""
      ) do
    with {:ok, _} <- validate_tag_length(tag) do
      case :crypto.crypto_one_time_aead(
             :aes_256_gcm,
             key,
             initialization_vector,
             encrypted_data,
             authenticated_additional_data,
             tag,
             @decrypt
           ) do
        :error -> {:error, :decrypt_failed}
        decrypted -> {:ok, decrypted}
      end
    end
  end

  defp validate_tag_length(tag) when byte_size(tag) == @tag_length, do: {:ok, tag}
  defp validate_tag_length(_tag), do: {:error, :invalid_tag_length}
end

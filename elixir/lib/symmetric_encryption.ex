defmodule SymmetricEncryption do
  @moduledoc """
  Documentation for `SymmetricEncryption`.
  """

  @tag_length 16

  @encrypt true
  @decrypt not @encrypt

  @spec encrypt(data :: binary(), key :: <<_::256>>) ::
          {:ok, {iv :: <<_::96>>, encrypted_data :: binary(), tag :: <<_::128>>}}
  def encrypt(data, key) do
    initialization_vector = :crypto.strong_rand_bytes(12)

    encrypt(data, key, initialization_vector)
  end

  @spec encrypt(data :: binary(), key :: <<_::256>>, iv :: binary(), aad :: binary()) ::
          {:ok, {binary(), binary(), binary()}}
  def encrypt(data, key, initialization_vector, authenticated_additional_data \\ "") do
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
        _ -> error |> IO.inspect()
      end
  end

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
  defp validate_tag_length(tag), do: {:error, :invalid_tag_length}
end

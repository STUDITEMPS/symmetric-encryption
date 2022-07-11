defmodule SymmetricEncryptionTest do
  use ExUnit.Case
  doctest SymmetricEncryption

  describe "encrypt/3" do
    test "encrypts some data given a key of valid length" do
      data = "hello"
      # 256 bits are 32 bytes
      key = :crypto.strong_rand_bytes(32)

      assert {:ok, {_initialization_vector, _encrypted_data, tag}} =
               SymmetricEncryption.encrypt(data, key)

      assert byte_size(tag) == 16
    end

    test "encrypts with additional data" do
      data = "hello"
      key = :crypto.strong_rand_bytes(32)

      additional_data = "some plaintext but authenticated data"

      assert {:ok, {_initialization_vector, _encrypted_data, _tag}} =
               SymmetricEncryption.encrypt(
                 data,
                 key,
                 additional_data
               )
    end

    test "fails given a key of invalid length" do
      data = "hello"
      key = :crypto.strong_rand_bytes(31)

      assert {:error, _message} = SymmetricEncryption.encrypt(data, key)
    end
  end

  describe "encrypt_with_iv/4" do
    test "encrypts with initialization vector and additional data" do
      data = "hello"
      key = :crypto.strong_rand_bytes(32)
      # can be of any length
      initialization_vector = :crypto.strong_rand_bytes(32)

      additional_data = "some plaintext but authenticated data"

      assert {:ok, {_initialization_vector, _encrypted_data, _tag}} =
               SymmetricEncryption.encrypt_with_iv(
                 data,
                 key,
                 initialization_vector,
                 additional_data
               )
    end
  end

  describe "decrypt/4" do
    test "decrypts with correct key, initialization vector and tag" do
      data = "hello"
      key = :crypto.strong_rand_bytes(32)

      {:ok, {initialization_vector, encrypted_data, tag}} = SymmetricEncryption.encrypt(data, key)

      assert {:ok, "hello"} =
               SymmetricEncryption.decrypt(encrypted_data, key, initialization_vector, tag)
    end

    test "fails with incorrect key" do
      data = "hello"
      key = :crypto.strong_rand_bytes(32)

      {:ok, {initialization_vector, encrypted_data, tag}} = SymmetricEncryption.encrypt(data, key)

      other_key = :crypto.strong_rand_bytes(32)

      assert {:error, :decrypt_failed} =
               SymmetricEncryption.decrypt(encrypted_data, other_key, initialization_vector, tag)
    end

    test "fails with too short tag" do
      data = "hello"
      key = :crypto.strong_rand_bytes(32)

      {:ok, {initialization_vector, encrypted_data, _tag}} =
        SymmetricEncryption.encrypt(data, key)

      short_tag = :crypto.strong_rand_bytes(15)

      assert {:error, :invalid_tag_length} =
               SymmetricEncryption.decrypt(encrypted_data, key, initialization_vector, short_tag)
    end

    test "fails with fake tag" do
      data = "hello"
      key = :crypto.strong_rand_bytes(32)

      {:ok, {initialization_vector, encrypted_data, _tag}} =
        SymmetricEncryption.encrypt(data, key)

      fake_tag = :crypto.strong_rand_bytes(16)

      assert {:error, :decrypt_failed} =
               SymmetricEncryption.decrypt(encrypted_data, key, initialization_vector, fake_tag)
    end

    test "fails with fake initialization_vector" do
      data = "hello"
      key = :crypto.strong_rand_bytes(32)

      {:ok, {_initialization_vector, encrypted_data, tag}} =
        SymmetricEncryption.encrypt(data, key)

      fake_initialization_vector = :crypto.strong_rand_bytes(16)

      assert {:error, :decrypt_failed} =
               SymmetricEncryption.decrypt(
                 encrypted_data,
                 key,
                 fake_initialization_vector,
                 tag
               )
    end
  end
end

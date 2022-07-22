# frozen_string_literal: true

require_relative "symmetric_encryption/version"
require "openssl"
require "base64"

# Provides symmetric encryption via AES-256-GCM
module SymmetricEncryption
  class DecryptionError < StandardError; end
  EncryptionResult = ::Struct.new(:aad, :ciphertext, :iv, :tag)

  ALGORITHM = "aes-256-gcm"
  TAG_LENGTH = 16

  def self.encrypt(data, named_key)
    key_name, key = named_key.split(":")
    cipher = ::OpenSSL::Cipher.new(ALGORITHM).encrypt
    cipher.key = key
    iv = cipher.random_iv
    cipher.iv = iv
    cipher.auth_data = ""

    encrypted_data = cipher.update(data) + cipher.final

    build_result(encrypted_data, cipher, iv, key_name)
  end

  def self.decrypt(aad, encrypted_data, named_keys, initialization_vector, tag)
    tag = decode(tag)
    raise DecryptionError, "invalid tag length" if tag.bytesize != TAG_LENGTH

    named_keys.each do |named_key|
      key_name, key = named_key.split(":")
      next if aad != key_name

      return decipher(key, initialization_vector, tag, encrypted_data)
    end
  end

  def self.decipher(key, ini_vector, tag, encrypted_data)
    decipher = ::OpenSSL::Cipher.new(ALGORITHM).decrypt
    decipher.key = key
    initialization_vector = decode(ini_vector)
    decipher.iv = initialization_vector
    decipher.auth_tag = tag
    decipher.auth_data = ""

    encrypted_data = decode(encrypted_data)
    decipher.update(encrypted_data) + decipher.final
  rescue ::OpenSSL::CipherError
    raise DecryptionError
  end

  def self.build_result(encrypted_data, cipher, ini_vector, key_name)
    EncryptionResult.new(
      key_name,
      encode(encrypted_data),
      encode(ini_vector),
      encode(cipher.auth_tag(TAG_LENGTH))
    )
  end

  def self.encode(value)
    ::Base64.encode64(value)
  end

  def self.decode(value)
    ::Base64.decode64(value)
  end
end

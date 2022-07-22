# frozen_string_literal: true

require_relative "symmetric_encryption/version"
require "openssl"
require "base64"

# Provides symmetric encryption via AES-256-GCM
module SymmetricEncryption
  class DecryptionError < StandardError; end
  EncryptionResult = ::Struct.new(:encrypted_data, :initialization_vector, :tag)

  ALGORITHM = "aes-256-gcm"
  TAG_LENGTH = 16

  def self.encrypt(data, key)
    cipher = ::OpenSSL::Cipher.new(ALGORITHM).encrypt
    cipher.key = key
    iv = cipher.random_iv
    cipher.iv = iv
    cipher.auth_data = ""

    encrypted_data = cipher.update(data) + cipher.final

    EncryptionResult.new(encode(encrypted_data), encode(iv), encode(cipher.auth_tag(TAG_LENGTH)))
  end

  def self.decrypt(encrypted_data, key, initialization_vector, tag, authenticated_additional_data)
    tag = decode(tag)
    raise DecryptionError, "invalid tag length" if tag.bytesize != TAG_LENGTH

    decipher = ::OpenSSL::Cipher.new(ALGORITHM).decrypt
    decipher.key = key
    initialization_vector = decode(initialization_vector)
    decipher.iv = initialization_vector
    decipher.auth_tag = tag
    decipher.auth_data = authenticated_additional_data

    encrypted_data = decode(encrypted_data)
    decipher.update(encrypted_data) + decipher.final
  rescue ::OpenSSL::CipherError
    raise DecryptionError
  end

  def self.encode(value)
    ::Base64.encode64(value)
  end

  def self.decode(value)
    Base64.decode64(value)
  end
end

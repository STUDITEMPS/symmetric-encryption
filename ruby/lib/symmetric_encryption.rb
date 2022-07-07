# frozen_string_literal: true

require_relative "symmetric_encryption/version"
require "openssl"

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

    EncryptionResult.new(encrypted_data, iv, cipher.auth_tag(TAG_LENGTH))
  end

  def self.decrypt(encrypted_data, key, initialization_vector, tag, authenticated_additional_data)
    raise DecryptionError, "invalid tag length" if tag.bytesize != TAG_LENGTH

    decipher = ::OpenSSL::Cipher.new(ALGORITHM).decrypt
    decipher.key = key
    decipher.iv = initialization_vector
    decipher.auth_tag = tag
    decipher.auth_data = authenticated_additional_data

    decipher.update(encrypted_data) + decipher.final
  rescue ::OpenSSL::CipherError
    raise DecryptionError
  end
end

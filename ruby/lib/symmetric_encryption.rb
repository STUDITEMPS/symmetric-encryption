# frozen_string_literal: true

require_relative "symmetric_encryption/version"
require "openssl"
require "base64"

# Provides symmetric encryption via AES-256-GCM
module SymmetricEncryption
  # Encrypts domain events accoring to given pii
  class DomainEvent
    def self.encrypt_domain_event(domain_event, named_key)
      handle_domain_event(domain_event, named_key) do |value|
        SymmetricEncryption.encrypt(value, named_key)
      end
    end

    def self.decrypt_domain_event(domain_event, named_keys = [])
      handle_domain_event(domain_event, named_keys) do |value|
        value = JSON(value)
        SymmetricEncryption.decrypt(value["aad"], value["ciphertext"], named_keys, value["iv"], value["tag"])
      end
    end

    def self.handle_domain_event(domain_event, named_key)
      return if named_key.empty? || domain_event.nil?

      pii = domain_event["pii"]&.values&.flatten || []

      pii.each do |path|
        keys = path.split(".")[1..]
        value = domain_event.dig(*keys)
        altered_value = yield(value)
        set_nested_value(domain_event, keys, altered_value)
      end
      domain_event
    end

    def self.set_nested_value(domain_event, keys, value, force: false)
      if keys.one?
        value = value.to_json if value.is_a?(SymmetricEncryption::EncryptionResult)
        domain_event[keys[0]] = value if domain_event.key?(keys[0]) || force
        return
      end

      found = domain_event[keys[0]]
      set_nested_value(found, keys[1..], value)
    end
  end

  class DecryptionError < StandardError; end
  EncryptionResult = ::Struct.new(:aad, :ciphertext, :iv, :tag) do
    def to_json(**args)
      to_h.to_json(args)
    end
  end

  ALGORITHM = "aes-256-gcm"
  TAG_LENGTH = 16

  def self.encrypt(data, named_key)
    return nil if data.nil? || data.empty?

    key_name, key = named_key.split(":")
    cipher = ::OpenSSL::Cipher.new(ALGORITHM).encrypt
    cipher.key = key
    iv = cipher.random_iv
    cipher.iv = iv
    cipher.auth_data = ""

    encrypted_data = cipher.update(data.to_s) + cipher.final

    build_result(encrypted_data, cipher, iv, key_name)
  end

  def self.decrypt(aad, encrypted_data, named_keys, initialization_vector, tag)
    return nil if encrypted_data.nil?

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

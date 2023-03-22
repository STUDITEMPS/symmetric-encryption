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
        SymmetricEncryption.encrypt(value.to_json, named_key)
      end
    end

    def self.decrypt_domain_event(domain_event, named_keys = [])
      handle_domain_event(domain_event, named_keys) do |value|
        decrypted_value = SymmetricEncryption.decrypt_value(value, named_keys)
        JSON.parse(decrypted_value)
      end
    end

    def self.handle_domain_event(domain_event, named_key)
      return if named_key.empty? || domain_event.nil?

      pii_fields(domain_event).each do |path|
        keys, value = referenced_field(domain_event, path)
        altered_value = yield(value)
        set_nested_value(domain_event, keys, altered_value)
      end
      domain_event
    end

    def self.pii_fields(domain_event)
      domain_event["pii"]&.values&.flatten || []
    end

    def self.referenced_field(domain_event, path)
      keys = path.split(".")[1..]
      value = dig!(domain_event, keys)
      [keys, value]
    end

    def self.dig!(hash, keys, index = 0)
      current_key = keys[index]
      if hash.key?(current_key)
        if index == (keys.length - 1)
          return hash[current_key]
        else
          return dig!(hash[current_key], keys, index + 1)
        end
      end
      raise PathNotFoundError
    end

    def self.set_nested_value(domain_event, keys, value, force: false)
      if keys.one?
        value = JSON(value.to_json) if value.is_a?(SymmetricEncryption::EncryptionResult)
        domain_event[keys[0]] = value if domain_event.key?(keys[0]) || force
        return
      end

      found = domain_event[keys[0]]
      set_nested_value(found, keys[1..], value)
    end
  end

  class PathNotFoundError < StandardError; end
  class DecryptionError < StandardError; end

  EncryptionResult = ::Struct.new(:aad, :ciphertext, :iv, :tag) do
    def to_json(**args)
      to_h.to_json(args)
    end
  end

  ALGORITHM = "aes-256-gcm"
  TAG_LENGTH = 16

  def self.encrypt(data, named_key)
    key_name, key = named_key.split(":")
    cipher = ::OpenSSL::Cipher.new(ALGORITHM).encrypt
    cipher.key = decode(key)
    iv = cipher.random_iv
    cipher.iv = iv
    cipher.auth_data = key_name

    encrypted_data = cipher.update(data) + cipher.final

    build_result(encrypted_data, cipher, iv, key_name)
  end

  def self.decrypt_value(value, named_keys)
    encrypted_data = value["ciphertext"] || raise(DecryptionError, "invalid data")
    used_key = value["aad"]
    initialization_vector = value["iv"]
    tag = decode(value["tag"])
    raise DecryptionError, "invalid tag length" if tag.bytesize != TAG_LENGTH

    decipher(find_key_by_name(used_key, named_keys), initialization_vector, used_key, tag, encrypted_data)
  end

  def self.find_key_by_name(key_name, named_keys)
    the_key = named_keys.find do |key|
      key.start_with?(key_name.to_s)
    end || raise(DecryptionError, "unknown key #{key_name}")

    the_key.split(":")[1]
  end

  def self.decipher(key, initialization_vector, aad, tag, encrypted_data)
    decipher = ::OpenSSL::Cipher.new(ALGORITHM).decrypt
    decipher.key = ::Base64.decode64(key)
    initialization_vector = decode(initialization_vector)
    decipher.iv = initialization_vector
    decipher.auth_tag = tag
    decipher.auth_data = aad

    encrypted_data = decode(encrypted_data)
    decipher.update(encrypted_data) + decipher.final
  rescue ::OpenSSL::Cipher::CipherError
    raise DecryptionError
  end

  def self.build_result(encrypted_data, cipher, initialization_vector, key_name)
    EncryptionResult.new(
      key_name,
      encode(encrypted_data),
      encode(initialization_vector),
      encode(cipher.auth_tag(TAG_LENGTH))
    )
  end

  def self.encode(value)
    ::Base64.encode64(value).strip
  end

  def self.decode(value)
    ::Base64.decode64(value.strip)
  end
end

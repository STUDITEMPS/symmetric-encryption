# frozen_string_literal: true

require_relative "symmetric_encryption"

# Encrypts domain events accoring to given pii
class LimePie
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

    pii = domain_event["pii"].values.flatten

    pii.each do |path|
      keys = path.split(".")[1..]
      value = domain_event.dig(*keys)
      altered_value = yield(value)
      set_nested_value(domain_event, keys, altered_value)
    end
    domain_event
  end

  def self.set_nested_value(domain_event, keys, value)
    if keys.count == 1
      value = value.to_json if value.is_a?(SymmetricEncryption::EncryptionResult)
      return domain_event[keys[0]] = value
    end

    found = domain_event[keys[0]]
    set_nested_value(found, keys[1..], value)
  end
end

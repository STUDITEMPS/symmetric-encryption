# frozen_string_literal: true

require "test_helper"
require "securerandom"
require "json"

class TestSymmetricEncryption < Minitest::Test
  def test_encrypts_domain_event
    domain_event = File.read(
      "../domain-events/bounded-contexts/studentenverwaltung/events/telefonnummer-geaendert/event-specs/default.json"
    )
    raw_number = "+49151234567890"
    named_key = "randomlyNamedKey:#{SecureRandom.hex(16)}"

    encrypted_domain_event = ::SymmetricEncryption::DomainEvent.encrypt_domain_event(JSON(domain_event), named_key)
    assert !encrypted_domain_event.include?(raw_number)
  end

  def test_decrypt_domain_event
    named_key = "randomlyNamedKey:#{SecureRandom.hex(16)}"
    raw_anrede = "Herr"
    domain_event = File.read(
      "../domain-events/bounded-contexts/kundenverwaltung/events/anrede-geaendert/event-specs/default.json"
    )
    encrypt_domain_event = ::SymmetricEncryption::DomainEvent.encrypt_domain_event(JSON(domain_event), named_key)

    decrypted_domain_event = ::SymmetricEncryption::DomainEvent.decrypt_domain_event(encrypt_domain_event, [named_key])

    assert decrypted_domain_event["aendert_anrede"]["anrede"] == raw_anrede
  end
end

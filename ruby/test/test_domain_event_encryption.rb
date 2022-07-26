# frozen_string_literal: true

require "test_helper"
require "securerandom"
require "json"

class TestSymmetricEncryption < Minitest::Test
  def named_key
    @named_key ||= "randomlyNamedKey:#{SecureRandom.hex(16)}"
  end

  def test_encrypts_domain_event
    domain_event = load_domain_event("studentenverwaltung", "telefonnummer-geaendert")

    raw_number = "+49151234567890"

    encrypted_domain_event = ::SymmetricEncryption::DomainEvent.encrypt_domain_event(JSON(domain_event), named_key)
    assert !encrypted_domain_event.include?(raw_number)
  end

  def test_does_not_change_event_unless_pii_exist
    domain_event = load_domain_event("schichtplanung", "anzahl-benoetigter-studenten-in-schicht-erhoeht")

    encrypted_domain_event = ::SymmetricEncryption::DomainEvent.encrypt_domain_event(JSON(domain_event), named_key)

    assert JSON(domain_event) == encrypted_domain_event
  end

  def test_encrypts_domain_event_with_integer_value
    domain_event = File.read("./test/fixtures/fantasy_domain_event_with_integer_pii.json")

    raw_number = 6

    encrypted_domain_event = ::SymmetricEncryption::DomainEvent.encrypt_domain_event(JSON(domain_event), named_key)
    assert !encrypted_domain_event.include?(raw_number)
  end

  def test_encrypts_domain_event_with_optional_value
    domain_event = load_domain_event("anzeigenkunden", "unternehmensaccount-angelegt")

    encrypted_domain_event = ::SymmetricEncryption::DomainEvent.encrypt_domain_event(JSON(domain_event), named_key)

    assert encrypted_domain_event["legt_unternehmensaccount_an"]["vorname"].nil?
    assert !encrypted_domain_event["legt_unternehmensaccount_an"]["unternehmensname"].nil?
  end

  def test_encrypts_domain_event_with_optional_value_missing
    raw_domain_event = load_domain_event("anzeigenkunden", "unternehmensaccount-angelegt")

    domain_event = JSON(raw_domain_event)
    domain_event["legt_unternehmensaccount_an"].delete("email")

    encrypted_domain_event = ::SymmetricEncryption::DomainEvent.encrypt_domain_event(domain_event, named_key)

    assert !encrypted_domain_event["legt_unternehmensaccount_an"].key?("email")
  end

  def test_decrypt_domain_event
    raw_anrede = "Herr"
    domain_event = load_domain_event("kundenverwaltung", "anrede-geaendert")

    encrypt_domain_event = ::SymmetricEncryption::DomainEvent.encrypt_domain_event(JSON(domain_event), named_key)

    decrypted_domain_event = ::SymmetricEncryption::DomainEvent.decrypt_domain_event(encrypt_domain_event, [named_key])

    assert decrypted_domain_event["aendert_anrede"]["anrede"] == raw_anrede
  end

  # helper

  def load_domain_event(context, name)
    File.read(
      "../domain-events/bounded-contexts/#{context}/events/#{name}/event-specs/default.json"
    )
  end
end

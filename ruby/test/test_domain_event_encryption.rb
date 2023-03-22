# frozen_string_literal: true

require "test_helper"
require "securerandom"
require "json"

# tests the encryption and decryption of domain events in a
# specific json format.
class TestDomainEventEncryption < Minitest::Test
  def named_key
    random_key = SecureRandom.hex(16)
    base_64_encoded_key = Base64.encode64(random_key)
    @named_key ||= "randomlyNamedKey:#{base_64_encoded_key}"
  end

  def test_encrypts_domain_event
    domain_event = load_domain_event("studentenverwaltung", "telefonnummer-geaendert")
    raw_number = "+49151234567890"

    encrypted_domain_event = encrypt_event(domain_event)

    assert !encrypted_domain_event.include?(raw_number)
  end

  def test_does_not_change_event_unless_pii_exist
    domain_event = load_domain_event("schichtplanung", "anzahl-benoetigter-studenten-in-schicht-erhoeht")

    encrypted_domain_event = encrypt_event(domain_event)

    assert_equal JSON.parse(domain_event), encrypted_domain_event
  end

  def test_encrypts_domain_event_with_integer_value
    domain_event = File.read("./test/fixtures/fantasy_domain_event_with_integer_pii.json")
    raw_number = 6

    encrypted_domain_event = encrypt_event(domain_event)

    assert !encrypted_domain_event.include?(raw_number)

    decrypted_domain_event = decrypt_event(encrypted_domain_event)

    data = decrypted_domain_event["erhoeht_anzahl_benoetigter_studenten_in_schicht"]["anzahl_benoetigter_studenten"]
    assert data == raw_number
  end

  def test_encrypts_domain_event_with_optional_value
    domain_event = load_domain_event("anzeigenkunden", "unternehmensaccount-angelegt")

    encrypted_domain_event = encrypt_event(domain_event)

    assert encrypted_domain_event.keys == JSON.parse(domain_event).keys

    decrypted_domain_event = decrypt_event(encrypted_domain_event)
    assert decrypted_domain_event == JSON.parse(domain_event)
  end

  def test_raises_exception_when_encrypting_domain_event_with_value_missing
    raw_domain_event = load_domain_event("anzeigenkunden", "unternehmensaccount-angelegt")

    domain_event = JSON(raw_domain_event)
    domain_event["legt_unternehmensaccount_an"].delete("email")

    assert_raises SymmetricEncryption::PathNotFoundError do
      encrypt_event(domain_event.to_json)
    end
  end

  def test_decrypt_domain_event
    raw_anrede = "Herr"
    domain_event = load_domain_event("kundenverwaltung", "anrede-geaendert")

    encrypted_domain_event = encrypt_event(domain_event)

    decrypted_domain_event = decrypt_event(encrypted_domain_event)

    assert decrypted_domain_event["aendert_anrede"]["anrede"] == raw_anrede
  end

  # helper

  def load_domain_event(context, name)
    File.read(
      "../domain-events/bounded-contexts/#{context}/events/#{name}/event-specs/default.json"
    )
  end

  def encrypt_event(event)
    ::SymmetricEncryption::DomainEvent.encrypt_domain_event(JSON(event), named_key)
  end

  def decrypt_event(event)
    ::SymmetricEncryption::DomainEvent.decrypt_domain_event(event, [named_key])
  end
end

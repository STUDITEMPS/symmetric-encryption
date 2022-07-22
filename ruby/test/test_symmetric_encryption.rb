# frozen_string_literal: true

require "test_helper"
require "securerandom"

class TestSymmetricEncryption < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SymmetricEncryption::VERSION
  end

  def test_encrypts_data_given_valid_key
    named_key = "randomlyNamed:#{SecureRandom.hex(16)}"
    result = ::SymmetricEncryption.encrypt("secret text", named_key)

    refute_nil result.iv
    refute_nil result.ciphertext
    refute_nil result.tag
    refute_nil result.aad

    raw_tag = SymmetricEncryption.decode(result.tag)
    assert raw_tag.bytesize == 16
  end
end

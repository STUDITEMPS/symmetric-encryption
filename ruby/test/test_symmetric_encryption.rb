# frozen_string_literal: true

require "test_helper"
require "securerandom"

class TestSymmetricEncryption < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SymmetricEncryption::VERSION
  end

  def test_encrypts_data_given_valid_key
    key = SecureRandom.bytes(32)
    result = ::SymmetricEncryption.encrypt("secret text", key)

    refute_nil result.initialization_vector
    refute_nil result.encrypted_data
    refute_nil result.tag

    raw_tag = SymmetricEncryption.decode(result.tag)
    assert raw_tag.bytesize == 16
  end
end

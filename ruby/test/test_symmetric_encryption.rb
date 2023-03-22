# frozen_string_literal: true

require "test_helper"
require "securerandom"

# tests encryption and decryxption of strings.
# The encoding and decoding of complex values (eg JSON)
# must be handled by the calling code
class TestSymmetricEncryption < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SymmetricEncryption::VERSION
  end

  def test_encrypts_data_given_valid_key
    result = ::SymmetricEncryption.encrypt("secret text", named_key)

    refute_nil result.iv
    refute_nil result.ciphertext
    refute_nil result.tag
    refute_nil result.aad

    raw_tag = SymmetricEncryption.decode(result.tag)
    assert raw_tag.bytesize == 16
  end

  def test_decrypts_data_given_valid_key
    named_key = "test2023-03-22T14_13_05.103523Z:WG+ToAWIYYljNB8w0MU4CCS3U/2D0SX9My+nTj/SKEU="
    encrypted_value = { "aad" => "test2023-03-22T14_13_05.103523Z",
                        "ciphertext" => "c899zP0OITNzjBZRHZbgiQwVoqQrn+HyLfu/XmeLatMUGjxEYB" \
                                        "9iaBxB9kga\nhT/FVIt4JDcZO2F8y4YSJq3tgA==",
                        "iv" => "CLnrIj40+OO4ge9L",
                        "tag" => "90GK5ymCgt8qoIBC0VJizA==" }
    decrypted_value = ::SymmetricEncryption.decrypt_value(encrypted_value, [named_key])

    assert decrypted_value == "\"Hey Bob, stop sniffing around stuff that does not concern you!\""
  end

  def named_key
    @named_key ||= "randomlyNamedKey:#{Base64.encode64(random_key)}"
  end

  def random_key
    @random_key ||= SecureRandom.hex(16)
  end
end

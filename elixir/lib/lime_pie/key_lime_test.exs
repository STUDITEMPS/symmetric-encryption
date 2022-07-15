defmodule LimePie.KeyLimeTest do
  use ExUnit.Case
  alias LimePie.KeyLime
  doctest KeyLime

  describe("parse_multiple_keys/1") do
    test "returns an error if the string is empty" do
      assert {:error, :empty_string_to_parse} == KeyLime.parse_multiple_keys("")
    end
  end
end

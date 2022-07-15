defmodule LimePie.ConfigTest do
  use ExUnit.Case, async: false

  test "does not through an error on startup if no config is given" do
    # if you start the LimePie.Config in your application.ex
    # (as elixir/README.md suggests) it will use the a Config entry.
    # If you misconfigured that it will be nill, so we test that.
    start_supervised!({LimePie.Config, nil})
    assert {:error, :empty_string_to_parse} == LimePie.Config.keys()
    assert {:error, :no_keys_configured} == LimePie.Config.encryption_key()
    assert {:error, :no_keys_configured} == LimePie.Config.key("some_name")
  end

  def valid_config do
    [
      keys:
        "first:CBQiYwARYDnAfdqSYqHxvyCubc0NqkzZdF8Vdi1hKek=" <>
          ";" <>
          "second:T1oBUGSc30j3FgFJcNDT/2iST/ndoAyy1Bn5n4+ek/w=" <>
          ";" <>
          "broken:not_valid_64",
      encryption_key_name: "first"
    ]
  end

  describe "keys/0" do
    test "keys/0" do
      start_supervised!({LimePie.Config, valid_config()})

      assert ["broken", "first", "second"] == LimePie.Config.keys() |> Map.keys() |> Enum.sort()
    end
  end

  describe "key/1" do
    test "returns ok tuple for existing key" do
      start_supervised!({LimePie.Config, valid_config()})

      assert {:ok, %LimePie.KeyLime{}} = LimePie.Config.key("first")
    end

    test "returns error tuple for non existing key" do
      start_supervised!({LimePie.Config, valid_config()})

      assert {:error, :unknown_key} == LimePie.Config.key("non_existing_key")
    end

    test "returns error tuple for broken keys" do
      start_supervised!({LimePie.Config, valid_config()})

      assert {:error, :decoding_of_key_cipher_via_base_64_failed} == LimePie.Config.key("broken")
    end
  end

  describe "encryption_key/0" do
    test "returns ok tuple if key is configured" do
      start_supervised!({LimePie.Config, valid_config()})

      assert {:ok, %LimePie.KeyLime{}} = LimePie.Config.encryption_key()
    end

    test "returns error tuple if no encryption_key name is given" do
      start_supervised!(
        {LimePie.Config, valid_config() |> Keyword.put(:encryption_key_name, nil)}
      )

      assert {:error, :no_encyption_key_configured} = LimePie.Config.encryption_key()
    end

    test "returns error tuple if encryption_key is not known" do
      start_supervised!(
        {LimePie.Config, valid_config() |> Keyword.put(:encryption_key_name, "unknown_key")}
      )

      assert {:error, :unknown_key} = LimePie.Config.encryption_key()
    end

    test "returns error tuple if encryption_key is not valid" do
      start_supervised!(
        {LimePie.Config, valid_config() |> Keyword.put(:encryption_key_name, "broken")}
      )

      assert {:error, :decoding_of_key_cipher_via_base_64_failed} =
               LimePie.Config.encryption_key()
    end
  end
end

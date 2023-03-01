defmodule LimePieTest do
  use ExUnit.Case
  doctest LimePie

  describe("paths_to_personally_identifiable_information/1") do
    test "returns the list of referenced paths, dropping the referencing entity" do
      assert {:ok, [["a", "b"], ["e", "f"], ["c", "d"]]} =
               LimePie.paths_to_personally_identifiable_information(%{
                 "pii" => %{
                   "entity_1" => ["$.a.b", "$.e.f"],
                   "entity_2" => ["$.c.d", "$.e.f"]
                 }
               })
    end

    test "returns no keys if field :pii is missing" do
      assert {:ok, []} = LimePie.paths_to_personally_identifiable_information(%{})
    end
  end

  @valid_key LimePie.KeyLime.parse("valid_key:ng9D3ggto4zoXLxpn1qkKG/sXgZmoIngROxsifnlxkk=")
             |> elem(1)
  @other_key LimePie.KeyLime.parse("other_key:SCJz6GFD4krs4KN3Fdo1kXwsfJcm/7jZgrqu8fBX+H4=")
             |> elem(1)
  @valid_encrypted_value %{
    "aad" => "valid_key",
    "ciphertext" => "P51+eMDnA574QgFJ7r/Ijic=",
    "iv" => "vs1ikTgY4AsYO8y3",
    "tag" => "05bbRhBvHU2q3jz4RtgyhA=="
  }

  describe "decrypt_value/2" do
    test "returns the decrypted value if the correct key is given" do
      assert {:ok, "encrypted_value"} =
               LimePie.decrypt_value(@valid_encrypted_value, %{"valid_key" => @valid_key})
    end

    test "return an error if the value isnt a map with the required keys" do
      # retruns an error on strings
      assert {:error, :value_is_not_encrypted, "some string"} =
               LimePie.decrypt_value("some string", @valid_key)

      assert {:error, :value_is_not_encrypted, ["some", "list"]} =
               LimePie.decrypt_value(["some", "list"], @valid_key)

      @valid_encrypted_value
      |> Map.keys()
      |> Enum.map(fn encrypted_value_key ->
        Map.drop(@valid_encrypted_value, [encrypted_value_key])
      end)
      |> Enum.each(fn map_with_key_missing ->
        assert {:error, :value_is_not_encrypted, ^map_with_key_missing} =
                 LimePie.decrypt_value(map_with_key_missing, @valid_key)
      end)
    end

    test "returns an error if the correct key is missing" do
      assert {:error, :unknown_key, [missing_key_name: "valid_key"]} =
               LimePie.decrypt_value(@valid_encrypted_value, %{"other_key" => @other_key})
    end

    test "returns an error if the encoded value is not valid json value" do
      bad_json_value = "{\"not valid json\"}"

      aad = @valid_key.name

      {:ok, {iv, encrypted_data, tag}} =
        bad_json_value
        |> LimePie.SymmetricEncryption.encrypt(@valid_key.key, aad)

      encrypted_bad_value = %{
        "ciphertext" => Base.encode64(encrypted_data),
        "aad" => aad,
        "iv" => Base.encode64(iv),
        "tag" => Base.encode64(tag)
      }

      assert {:error, :jason_decoding_failed, _} =
               LimePie.decrypt_value(encrypted_bad_value, %{"valid_key" => @valid_key})
    end

    test "returns an error if the named key exist but doesnt work" do
      assert {:error, :decrypt_failed, []} =
               LimePie.decrypt_value(@valid_encrypted_value, %{"valid_key" => @other_key})
    end
  end

  describe "encrypt_value/2" do
    test "returns an encrypted value" do
      assert {:ok, encrypted_value} = LimePie.encrypt_value("encrypt me!", @valid_key)
      assert ["aad", "ciphertext", "iv", "tag"] == Map.keys(encrypted_value) |> Enum.sort()

      assert {:ok, "encrypt me!"} =
               LimePie.decrypt_value(encrypted_value, %{"valid_key" => @valid_key})
    end
  end

  describe "replace_values/2" do
    test "iterates of key_paths_with_values and stores the values at the paths in the object" do
      key_paths_with_values = [{[:a, :b], "a string"}, {[:a, :c], %{its_a: :map}}]
      object_before = %{a: %{b: "unchanged value 1", c: "unchanged_value 2", d: "its a keeper"}}

      assert %{a: %{b: "a string", c: %{its_a: :map}, d: "its a keeper"}} =
               LimePie.replace_values(object_before, key_paths_with_values)
    end
  end

  describe "map_values/3" do
    test "picks the values referenced by key_paths in json_object by piping it through the map_function" do
      key_paths = [[:a, :b], [:a, :c]]
      object_before = %{a: %{b: "unchanged value 1", c: "unchanged_value 2", d: "its a keeper"}}

      assert {:ok, [{[:a, :b], "##unchanged value 1"}, {[:a, :c], "##unchanged_value 2"}]} =
               LimePie.map_values(key_paths, object_before, fn value -> {:ok, "##" <> value} end)
    end

    test "returns errors if the map_function returns an error" do
      key_paths = [[:a, :b], [:a, :c]]
      object_before = %{a: %{b: "unchanged value 1", c: "unchanged_value 2", d: "its a keeper"}}

      assert {:error, :mapping_values_failed,
              [not_value_1: [{:path_to_pii, [:a, :c]}, {:some, :context}]]} =
               LimePie.map_values(key_paths, object_before, fn
                 "unchanged value 1" = value -> {:ok, "##" <> value}
                 _other_value -> {:error, :not_value_1, some: :context}
               end)
    end
  end

  @unencrypted_event %{
    "pii" => %{
      "entity_1" => ["$.a.b", "$.e.f"],
      "entity_2" => ["$.a.c", "$.e.f"]
    },
    "a" => %{
      "b" => "value at a.b",
      "c" => "value at a.c",
      "d" => "valut at a.d"
    },
    "e" => %{"f" => "value at e.f", "g" => "value at e.g"}
  }

  @encrypted_event %{
    "a" => %{
      "b" => %{
        "aad" => "valid_key",
        "ciphertext" => "tgtOUyxPuAa0lAmjhFA=",
        "iv" => "pH1QUmDfA2ZpGQ1G",
        "tag" => "ZJW9TZpeAHmPOkODkaNicA=="
      },
      "c" => %{
        "aad" => "valid_key",
        "ciphertext" => "xl/jbBZt6QA5md0AHTA=",
        "iv" => "i5orAWOEIzXO7eGB",
        "tag" => "8+YTeqydI0Bywul6p0chaA=="
      },
      "d" => "valut at a.d"
    },
    "e" => %{
      "f" => %{
        "aad" => "valid_key",
        "ciphertext" => "xnsEH9e8NEPaH+ayw2s=",
        "iv" => "d5P4J4IYiYNtkJv1",
        "tag" => "xfUrldhVB+CJF/hM7+xqIw=="
      },
      "g" => "value at e.g"
    },
    "pii" => %{"entity_1" => ["$.a.b", "$.e.f"], "entity_2" => ["$.a.c", "$.e.f"]}
  }

  describe "decrypt_domain_event/2" do
    test "decrypts a correctly encrypted event" do
      assert {:ok, @unencrypted_event} ==
               LimePie.decrypt_domain_event(@encrypted_event, %{"valid_key" => @valid_key})
    end

    test "fails if no matching key is found" do
      assert {:error, :mapping_values_failed,
              [
                unknown_key: [path_to_pii: ["a", "b"], missing_key_name: "valid_key"],
                unknown_key: [path_to_pii: ["e", "f"], missing_key_name: "valid_key"],
                unknown_key: [path_to_pii: ["a", "c"], missing_key_name: "valid_key"]
              ]} ==
               LimePie.decrypt_domain_event(@encrypted_event, %{"other_key" => @valid_key})
    end

    test "fails if named key does not work" do
      assert {:error, :mapping_values_failed,
              [
                decrypt_failed: [path_to_pii: ["a", "b"]],
                decrypt_failed: [path_to_pii: ["e", "f"]],
                decrypt_failed: [path_to_pii: ["a", "c"]]
              ]} ==
               LimePie.decrypt_domain_event(@encrypted_event, %{"valid_key" => @other_key})
    end
  end

  describe "encrypt_event/2" do
    assert {:ok, freshly_encrypted_event} =
             LimePie.encrypt_domain_event(@unencrypted_event, @valid_key)

    assert {:ok, @unencrypted_event} ==
             LimePie.decrypt_domain_event(freshly_encrypted_event, %{"valid_key" => @valid_key})
  end
end

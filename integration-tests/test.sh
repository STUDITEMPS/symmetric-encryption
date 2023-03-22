#!/usr/bin/env bash

set -o nounset # same as set -u
set -o errexit # same as set -e
set -o pipefail

PROJECT_DIR="$(dirname "$0")/.."
BIN_DIR="${PROJECT_DIR}/bin"
TEST_DIR="${PROJECT_DIR}/integration-tests"

key=$(./${BIN_DIR}/test_key)

echo "Encrypting & Decrypting with Elixir"
./${BIN_DIR}/encode_elixir ${TEST_DIR}/plaintext.json $key > "${PROJECT_DIR}/tmp/elixir_cipher.txt"
cat "${PROJECT_DIR}/tmp/elixir_cipher.txt"
echo
./${BIN_DIR}/decode_elixir "${PROJECT_DIR}/tmp/elixir_cipher.txt" $key

echo
echo
echo "Encrypting & Decrypting with ruby"
./${BIN_DIR}/encode_ruby ${TEST_DIR}/plaintext.json $key > "${PROJECT_DIR}/tmp/ruby_cipher.txt"
cat "${PROJECT_DIR}/tmp/ruby_cipher.txt"
echo
./${BIN_DIR}/decode_ruby "${PROJECT_DIR}/tmp/ruby_cipher.txt" $key

echo
echo
echo "Encrypting with Elixir & Decrypting with Ruby"
./${BIN_DIR}/encode_elixir ${TEST_DIR}/plaintext.json $key > "${PROJECT_DIR}/tmp/elixir_ruby_cipher.txt"
cat "${PROJECT_DIR}/tmp/elixir_ruby_cipher.txt"
echo
./${BIN_DIR}/decode_ruby "${PROJECT_DIR}/tmp/elixir_ruby_cipher.txt" $key

echo
echo
echo "Encrypting with Ruby & Decrypting with Elixir"
./${BIN_DIR}/encode_ruby ${TEST_DIR}/plaintext.json $key > "${PROJECT_DIR}/tmp/ruby_elixir_cipher.txt"
cat "${PROJECT_DIR}/tmp/ruby_elixir_cipher.txt"
echo
./${BIN_DIR}/decode_elixir "${PROJECT_DIR}/tmp/ruby_elixir_cipher.txt" $key
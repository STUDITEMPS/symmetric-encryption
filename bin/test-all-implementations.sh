#!/bin/sh
set -x 
set -e
cd `git rev-parse --show-toplevel`
( cd elixir ; mix test )
( cd ruby ; rake test )
bin/test-cross-language-encryption-and-decryption.sh

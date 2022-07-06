#!/bin/bash

# activate asdf
. $HOME/.asdf/asdf.sh

# hex (v1.0.1 -> see: https://github.com/hexpm/hex/commit/52be75c14b5623ba424a50dafdb56611a939af7d)
asdf exec mix archive.install github hexpm/hex ref 52be75c14b5623ba424a50dafdb56611a939af7d --force
# rebar (matching version depending on elixir? -> see: https://github.com/elixir-lang/elixir/blob/cc9e9b29a7b473010ed17f894e6a576983a9c294/lib/mix/lib/mix/tasks/local.rebar.ex#L124)
asdf exec mix local.rebar --force

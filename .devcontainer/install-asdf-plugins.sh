#!/bin/bash

# activate asdf
. $HOME/.asdf/asdf.sh
# Plugin Versions are pinned because we want a 💯 Percent reproducible dev environment.
# install and pin erlang: https://github.com/asdf-vm/asdf-erlang
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin update erlang c215f6b18b8f11debd097e700f62b5da62860419

# install and pin elixir: https://github.com/asdf-vm/asdf-elixir
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin update elixir 8d018f2fd2977d124c8a48af583d733fa0479c01

# install and pin ruby: https://github.com/asdf-vm/asdf-ruby
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin update ruby 424792aeeec98d3e335b187c5641e5eeba3fd6d5

# install versions configured in environment variables
asdf install

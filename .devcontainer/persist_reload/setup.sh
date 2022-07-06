#!/bin/bash

# Setup the bash history to persist across reloads.
# It works in tandem with 'PROMPT_COMMAND=history -a' which is set in  .devcontainer/docker-compose.yml
# as it seems that 'rebuilding' a devcontainer does not flush bash history from memory to $HISTFILE.
touch $PWD/.devcontainer/persist_reload/data/.bash_history
ln -sf $PWD/.devcontainer/persist_reload/data/.bash_history $HOME/.bash_history

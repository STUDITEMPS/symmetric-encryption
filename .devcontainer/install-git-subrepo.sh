#!/bin/bash

set -e
git clone https://github.com/ingydotnet/git-subrepo /usr/local/git-subrepo

echo "# added by install-git-subrepo.sh" >> ~/.bashrc
echo "source /usr/local/git-subrepo/.rc" >> ~/.bashrc
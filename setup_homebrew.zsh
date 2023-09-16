#!/usr/bin/env zsh

echo "\n <<< Starting HOMEBREW setup >>>\n"

if exists brew; then
    echo "brew exists ! skipping install"
else
    echo "brew does not exist ! continuing with install"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi 

# NB: in zshrc HOMEBREW_CASK_OPTS='--no-quarantine' to bypass macOs gatekeeper
#
# install all packages / apps in the Brewfile
brew bundle --verbose

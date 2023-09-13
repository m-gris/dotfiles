#!/usr/bin/env zsh

echo "\n <<< Starting HOMEBREW setup >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# NB: in zshrc HOMEBREW_CASK_OPTS='--no-quarantine' to bypass macOs gatekeeper
#
# install all packages / apps in the Brewfile
brew bundle --verbose

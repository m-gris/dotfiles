#!/usr/bin/env zsh

echo "\n <<< Starting HOMEBREW setup >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install all packages / apps in the Brewfile
brew bundle --verbose

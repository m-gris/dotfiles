#!/usr/bin/env zsh

echo "\n <<< Starting HOMEBREW setup >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install httpie
brew install bat 

# --no-quarantine: arg that will bypass / turn-off macOs "gatekeeper" ("Are you sure you want to install X...")
brew install --no-quarantine visual-studio-code

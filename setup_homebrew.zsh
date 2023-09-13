#!/usr/bin/env zsh

echo "\n <<< Starting HOMEBREW setup >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install httpie
brew install bat 

brew install visual-studio-code

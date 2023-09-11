#!/bin/bash

# setup_packer.sh

# Get Neovim distro name from argument
nvim_distro=$1

# Check if the name is provided
if [ -z "$nvim_distro" ]; then
  echo "Error: No Neovim distro name provided."
  exit 1
fi

# Define the install path
install_path="$HOME/.local/share/$nvim_distro/site/pack/packer/start/packer.nvim"

# Create the directory if it doesn't exist
mkdir -p $install_path

# Clone packer.nvim into the install path
git clone --depth 1 https://github.com/wbthomason/packer.nvim $install_path


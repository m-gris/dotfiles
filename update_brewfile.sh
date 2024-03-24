#!/bin/zsh

# Navigate to your dotfiles git repository
cd ~/.dotfiles

# Update Brewfile
/opt/homebrew/bin/brew bundle dump --force --describe

# Check if Brewfile has changes
if git diff --exit-code Brewfile >/dev/null; then
    : # This is a no-op, acting as a placeholder
else
    # Add the Brewfile to staging
    git add Brewfile

    # Commit with current date
    git commit -m "Update Brewfile $(date +%Y-%m-%d)"

    # Optionally, push to remote
    git push
fi

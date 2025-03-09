#!/bin/bash

# Destination directory
DEST="$HOME/.config/nvim"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST"

# Copy all files and directories from the current directory to ~/.config/nvim
rsync -av --exclude=".git" ./ "$DEST"


echo "✅ All files copied to $DEST"

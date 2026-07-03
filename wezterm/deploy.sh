#!/bin/bash

# Destination directory
DEST="$HOME/.config/wezterm"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST"

# Copy all files and directories from the current directory to ~/.config/wezterm
rsync -av --exclude="deploy.sh" --exclude=".git" ./ "$DEST"


echo "✅ All files copied to $DEST"

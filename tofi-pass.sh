#!/bin/bash
# Copy a password to the clipboard using tofi

# Check if tofi is installed
if ! command -v tofi &> /dev/null
then
    echo "tofi could not be found"
    exit
fi

# Get all the passwords
PASS=$(find "$HOME/.password-store" -name '*.gpg' | sed "s|$HOME\/.password-store\/||g" | sed 's/.gpg//g')

# Get the password to copy
PASS=$(echo "$PASS" | tofi --prompt-text "Select a password to copy: " 2>/dev/null)

# Copy the password to the clipboard
RET=$(pass show --clip "$PASS")

# Notify if notif-send is installed
if command -v notify-send &> /dev/null
then
    notify-send -t 45000 "tofi-pass" "$RET"
fi

#!/bin/bash

# DESCRIPTION
# Install System Software (e.g. Homebrew, Cask etc.)

if ! command -v brew > /dev/null; then
    echo "[SYSTEM] Install Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile
    eval $(/opt/homebrew/bin/brew shellenv)
else
    echo "[SYSTEM] Update Homebrew"
    brew update
fi
echo ""

brew bundle

cp .mackup.cfg ~/.mackup.cfg
mackup restore
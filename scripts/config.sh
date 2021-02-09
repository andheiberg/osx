#!/bin/bash

# DESCRIPTION
# Configure macOS (e.g. finder settings, scroll speed, etc.).

if ask "[CONFIG] Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)" Y; then
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
fi

if ask "[CONFIG] Disable menu bar transparency" N; then
  defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false
fi

if ask "[CONFIG] Show all filename extensions in Finder" Y; then
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
fi

if ask "[CONFIG] Expand save panel by default" Y; then
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
fi

if ask "[CONFIG] Expand print panel by default" Y; then
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
fi

if ask "[CONFIG] Use current directory as default search scope in Finder" Y; then
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
fi

if ask "[CONFIG] Show Path bar in Finder" Y; then
  defaults write com.apple.finder ShowPathbar -bool true
fi

if ask "[CONFIG] Show Status bar in Finder" Y; then
  defaults write com.apple.finder ShowStatusBar -bool true
fi

if ask "[CONFIG] Disable the warning when changing a file extension" N; then
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
fi

if ask "[CONFIG] Automatically hide and show the Dock" Y; then
  defaults write com.apple.dock autohide -bool true
fi

if ask "[CONFIG] Set the icon size of the Dock to 36 pixels" Y; then
  defaults write com.apple.dock tilesize -int 36
fi

if ask "[CONFIG] A bit faster Trackpad" Y; then
  defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3
  defaults write NSGlobalDomain com.apple.mouse.scaling -float 2.5
fi

if ask "[CONFIG] Show the ~/Library folder" Y; then
  chflags nohidden ~/Library
fi

if ask "[CONFIG] Show Hidden Files in Finder" Y; then
  chflags nohidden ~/Library
fi

if ask "[CONFIG] Use column view in all Finder windows by default" Y; then
  defaults write com.apple.finder FXPreferredViewStyle Clmv
fi

if ask "[CONFIG] Kill affected applications" Y; then
  for app in Finder Dock SystemUIServer; do
    killall "$app" >/dev/null 2>&1
  done
  echo
  echo "** \033[33mSome changes needs a reboot to take effect\033[0m **"
  echo
fi

dockutil --remove all
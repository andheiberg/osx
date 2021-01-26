#!/bin/bash

# DESCRIPTION
# Executes the command line interface.

# USAGE
# ./setup.sh [OPTION]

# ASK

function ask {
  while true; do

    if [ "$2" == "Y" ]; then
      prompt="\033[1;32mY\033[0m/n"
      default=Y
    elif [ "$2" == "N" ]; then
      prompt="y/\033[1;32mN\033[0m"
      default=N
    else
      prompt="y/n"
      default=
    fi

    printf "$1 [$prompt] "

    if [ "$INTERACTIVE_MODE" -eq 1 ]; then
      echo
    else
      read yn
    fi

    if [ -z "$yz" ]; then
      yn=$default
    fi

    case $yn in
      [Yy]*) return 0 ;;
      [Nn]*) return 1 ;;
    esac
  done
}


# OPTIONS

process_option() {
  case $2 in
    'n')
      echo "Running in non-interactive mode..."
      INTERACTIVE_MODE=1;;
    *)
      echo "Running in interactive mode..."
      INTERACTIVE_MODE=0;;
  esac

  case $1 in
    'all')
      source scripts/system.sh
      source scripts/config.sh
      source scripts/dev.sh
      source scripts/git.sh
      source scripts/ssh.sh
      break;;
    'brew')
      brew bundle
      break;;
    'config')
      source scripts/config.sh
      break;;
    'dev')
      source scripts/dev.sh
      break;;
    'git')
      source scripts/git.sh
      break;;
    'ssh')
      source scripts/ssh.sh
      break;;
    'system')
      source scripts/system.sh
      break;;
    'q')
      break;;
    *)
      break;;
  esac
}


# MENU
while true; do
  if [[ $# == 0 ]]; then
    echo ""
    echo "******************"
    echo "    Setup OS X    "
    echo "******************"
    echo ""
    echo "Available commands:"
    echo ""
    echo "      all:  Setup everything"
    echo ""
    echo "     brew:  Install Brewfile Dependencies & Applications"
    echo "   config:  Configure macOS (e.g. finder settings, scroll speed, etc.)"
    echo "      dev:  Configure developer tools (e.g. terminal, IDEs, etc.)"
    echo "      git:  Configure git (e.g. adding aliases)"
    echo "      ssh:  Create & copy SSH key"
    echo "   system:  Install System Software (e.g. Homebrew, Cask etc.)"
    echo ""
    echo "        q:  Quit/Exit."
    echo ""
    read -p "Enter option: " option
    echo ""
    echo ""
    read -p "Interactive mode (Y/n): " mode
    echo ""
    process_option $option $mode
  else
    process_option $1
  fi
done

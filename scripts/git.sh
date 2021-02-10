#!/bin/bash

# DESCRIPTION
# Configure git (e.g. adding aliases)

read -p "[GIT] Enter your name: " git_name
echo ""
read -p "[GIT] Enter your e-mail:" git_email
echo ""

git config --global user.name "${git_name}"
git config --global user.email "${git_email}"

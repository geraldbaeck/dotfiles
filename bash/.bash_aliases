#!/bin/bash

alias atom="atom ./"

# A better list all
alias ls="ls -a"

# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

# Update/reload bash_profile
alias reload="source ~/.bash_profile"

# Open current directory in finder
alias finder="open ."

# Navigate directories more easily.
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'

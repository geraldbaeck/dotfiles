#!/usr/bin/env bash

# who am I
printf 'Running %s\n' "$BASH_SOURCE"

source ~/.bash_prompt      # customized prompt
source ~/.bash_aliases     # bash aliases
source ~/.bash_exports     # common variable exports
source ~/.bash_functions   # useful functions, but did not find any:))
source ~/.bash_options     # bash options
source ~/.bash_externals   # external programs config like nvm, virtualenv, git ...

echo "It's done."

#!/usr/bin/env bash

# who am I
printf 'Running %s\n' "$BASH_SOURCE"

[ -n "$PS1" ] \
    && . ~/.bash_profile

###-tns-completion-start-###
if [ -f /Users/geraldback/.tnsrc ]; then 
    source /Users/geraldback/.tnsrc 
fi
###-tns-completion-end-###

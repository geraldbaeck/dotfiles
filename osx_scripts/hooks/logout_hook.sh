#!/usr/bin/env bash

#######################################################
# Executes all scripts in the logout folder on startup #
# See https://support.apple.com/de-at/HT2420          #
# #####################################################

for f in ~/osx_scripts/logout/*
do
    echo "Logout Script: $f"
    sh "$f"
done
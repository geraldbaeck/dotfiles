#!/usr/bin/env bash

#######################################################
# Executes all scripts in the login folder on startup #
# See https://support.apple.com/de-at/HT2420          #
# #####################################################

for f in ~/osx_scripts/login/*
do
    echo "Login Script: $f"
    sh "$f"
done
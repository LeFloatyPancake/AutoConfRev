#!/bin/bash

find ./ -maxdepth 1 -name revanced.apk -exec rm {} \;
rm -r ./build/*

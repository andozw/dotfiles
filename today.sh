#!/bin/bash

DIR=~/Documents/Notes
FILENAME=$(date +"%Y.%m.%d.txt")

mkdir -p "$DIR"

nvim "$DIR/$FILENAME"


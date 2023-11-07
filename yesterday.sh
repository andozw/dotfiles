#!/bin/bash

DIR=~/Documents/Notes
YESTERDAY=$(date -v-1d '+%Y.%m.%d.txt')

mkdir -p "$DIR"

nvim "$DIR/$YESTERDAY"


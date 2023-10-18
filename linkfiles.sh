#!/bin/bash
set -e

srcdir=~/Code/dotfiles
destdir=~

function print_error { echo "!!! Already exists !!! $@"; }
function print_success { echo "linked $@"; }

function maybe_link {
    filename="$destdir/$1"

    directoryname=$(dirname $filename)
    if [[ ! -d $directoryname ]]
    then
        echo "$1: Making dirs: $directoryname"
        mkdir -p $directoryname;
    fi

    if [ -e "$filename" ]
    then
        print_error "$filename"
        return
    else
        print_success "$filename"
        ln -s "$srcdir/$1" "$destdir/$1"
    fi
}


#maybe_link .bash_profile
maybe_link .inputrc
# maybe_link .vimrc
# maybe_link .bash_profile
maybe_link .zshrc
maybe_link .my_bash_aliases

echo "[Running dotfiles .bash_profile]"

##############################################################
# load Square specific bash_profile
##############################################################
source ~/Development/config_files/square/bash_profile
##############################################################

## Blah
## source ~/.bash_local

###########################################
# Feel free to make your own changes below.
###########################################


# vim: filetype=sh
# removed when switching to vim
source ~/Code/dotfiles/.my_bash_aliases

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"


# Added by Toolbox App
export PATH="$PATH:/Users/seana/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export GPG_TTY=$(tty)
. "$HOME/.cargo/env"

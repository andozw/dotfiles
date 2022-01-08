# Disable message about zsh being default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

# vim: filetype=sh
export HOMEBREW_NO_ANALYTICS=1

# Use neovim
export EDITOR=nvim
alias vim="nvim"
alias oldvim=/usr/local/bin/vim

# shortcuts for neovim
export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim

# Print the current git author when the shell loads
if [[ -n $(which git) ]]; then
  printf "${COLOR_LIGHT_CYAN}Current git author:${COLOR_YELLOW} ${GIT_AUTHOR_NAME:-$(git config user.name)} <${GIT_AUTHOR_EMAIL:-$(git config user.email)}>\n${COLOR_NC}"
fi

### 
# Shortcuts to dot files
###
alias bp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias vimrc="vim ~/.vimrc"

####
# Set up prompt
####
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '

# vim: filetype=sh
export GOROOT=/usr/local/opt/go/libexec

alias be="bundle exec "
alias ..="cd .."
alias dv="cd ~/Development"
alias dev="cd ~/Development"
alias notes="cd /Users/$USER/Documents/Notes"
alias code="cd ~/Code"
alias jv="cd ~/Development/java"
alias mb="git branch -a | grep $USER"
alias canary='git push -f origin head:canary'
alias tmp='cd ~/tmp'
alias runBitgo='node ./bin/bitgo-express --disableproxy'
alias test-conversion='cd ~/Development/java && pants test metrics/s-c-signalfx::'
alias percent='~/code/percent/percent'

## Run compileKotlin gradle task
alias gck="./gradlew compileKotlin"

## Git branch
bb () {
  read YYYY MM DD <<<$(date +'%Y %m %d')
  git co -b "$USER.$YYYY$MM$DD.$1"
}

## Git store staged file
grs () {
  git restore --staged $1
  git restore $1
}

## Searching
alias fn="find . -name " 
alias fni="find . -iname " 
fbb () {
  PATTERN=$1
  shift
  rg -F $PATTERN $@ ~/Development/java/redact -tjava 
}

## tell ripgrep to search hidden files
alias rg="rg --hidden --glob '!.git'"

## deploy diff for Java apps
remotediff () {
  ## arg1 = app, arg2 = env 
  dc=$([ "$2" = "prod" ] && echo "sjc2b" || echo "sjc1")
  env=$([ "$2" = "prod" ] && echo "production" || echo "staging")
  ./remote $1 deploy-diff --dc $dc --env $env $3
}

## diffstat for diffing other repos
## USAGE: diffstat <sha1> <sha2>
diffstat () { 
  echo '```'
  echo "Current: $1. Deploying $2"
  git log $1...$2 $3  --pretty=format:'%h %ad %s - %an' --date=short --no-merges; 
  echo '```'
}

## GIT
alias gaa="git add -A "
alias gcm="git commit -m "
alias gca="git commit --amend "
alias gds="git diff --staged"
alias gg="git log --decorate --oneline --graph --all"
alias ggg="git log --decorate --oneline --graph"
alias glno="git log --name-only"
alias gpr="git cmp"
# git log "short pretty"
alias glsp="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short --no-merges"


alias list-others="git branch | egrep -v 'sean' | egrep -v 'master' | xargs -n1 '-I{}' echo '{}'"
alias delete-others="git branch | egrep -v 'sean' | egrep -v 'master' | xargs -n1 '-I{}' git branch -D '{}'"


## prettyjson datafile.json
## cat datafile.json | prettyjson
alias prettyjson="ruby -e \"require 'json'; puts JSON.pretty_generate(JSON.parse(ARGF.read))\""

#####
## BITCOIN
#####
alias electrum-testnet="/Applications/Electrum.app/Contents/MacOS/Electrum --testnet"

##### 
## database
##### 
alias dumpbb="mysqldump --databases -u root redact_development > ~/tmp/db_back/redact-$(date +%F).sql"
dumpdb() {
  mysqldump --databases -u root $1 > ~/tmp/db_back/$1-$(date +%F).sql
}

## load db
## create table redact_development; 
## mysql -u root redact_development < ~/tmp/db_back/redact-2018-10-24.sql


## Git diff helper
difflog () {
  git log $2...$3  --pretty=format:'%h %ad %s - %an' --date=short --no-merges $1
}

## find port in use
fport () {
  sudo lsof -iTCP -sTCP:LISTEN -n -P | grep $1
}

# find ports from pid
fpid () {
  lsof -Pan -p $1 -i
}

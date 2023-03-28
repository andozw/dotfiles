# dotfiles
dot dot dot

## Install
* `chmod u+x linkfiles.sh`
* `./linkfiles.sh`
* Install [vim-plug](https://github.com/junegunn/vim-plug)
* Install [onedark](https://github.com/joshdick/onedark.vim)
* NOTE: Both should be in ~/.local/share/nvim/site/autoload
* Open neovim and run `:PlugInstall`

## Source bash_profile, add to ~/.zshrc
```
# Use bash_profile repo aliases
if [ -f ~/Code/dotfiles/.bash_profile ]; then 
    . ~/Code/dotfiles/.bash_profile
fi
```

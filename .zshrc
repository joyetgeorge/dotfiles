export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim  

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting) 

source $ZSH/oh-my-zsh.sh

alias c="clear"
alias vim="nvim"

source $(brew --prefix nvm)/nvm.sh


export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim  

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

alias c="clear"
alias vim="nvim"
alias nn='nvim .'
alias gpo='git push origin "$(git symbolic-ref --short HEAD)"'

source $(brew --prefix nvm)/nvm.sh

eval "$(starship init zsh)"

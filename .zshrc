export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim  

eval "$(starship init zsh)"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

alias c="clear"
alias vim="nvim"
alias gpo='git push origin "$(git symbolic-ref --short HEAD)"'

source $(brew --prefix nvm)/nvm.sh

export PATH="$HOME/.claude/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Create worktree and cd into it
wt() {
  local name=$1
  local base=${2:-dev}  # Default to dev, or specify: wt hotfix prod
  # Always use main worktree as root (first entry in worktree list)
  local root=$(/usr/bin/git worktree list | /usr/bin/head -1 | /usr/bin/awk '{print $1}')
  local project=$(/usr/bin/basename "$root")
  local path="${root}/../${project}-${name}"
  local is_new=false

  if [ ! -d "$path" ]; then
    # Skip hooks to avoid post-checkout hook issues in new worktrees
    /usr/bin/git -c core.hooksPath=/dev/null worktree add "$path" -b "$name" "$base" || return 1
    is_new=true
  fi
  builtin cd "$path" && echo "→ $path [$name from $base]"

  # Setup for new worktrees
  if $is_new; then
    # Copy .env.local from main worktree if it exists
    if [ -f "$root/.env.local" ]; then
      /bin/cp "$root/.env.local" "$path/.env.local" && echo "✓ Copied .env.local"
    fi
    # Run yarn install if package.json exists
    if [ -f "$path/package.json" ]; then
      echo "→ Running yarn install..."
      ( cd "$path" && /opt/homebrew/bin/yarn install )
    fi
  fi
}

# Remove worktree and go back to main
wtdone() {
  local current=$(pwd)
  local main=$(/usr/bin/git worktree list | /usr/bin/head -1 | /usr/bin/awk '{print $1}')

  # Don't delete main worktree
  if [ "$current" = "$main" ]; then
    echo "⚠ Cannot delete main worktree"
    return 1
  fi

  builtin cd "$main"
  /usr/bin/git worktree remove "$current" 2>/dev/null && echo "✓ Removed $(/usr/bin/basename "$current")"
}

# List worktrees
alias wtl="git worktree list"

wts() {
  local selected=$(/usr/bin/git worktree list | fzf --height 40% | awk '{print $1}')
  [ -n "$selected" ] && cd "$selected"
}

# Pick and delete a worktree (use -f to force)
wtd() {
  local force=""
  [[ "$1" == "-f" ]] && force="--force"

  local selected=$(/usr/bin/git worktree list | fzf --height 40% --header "Select worktree to delete" | awk '{print $1}')
  if [ -n "$selected" ]; then
    local current=$(pwd)
    # Don't delete if we're inside the selected worktree
    if [[ "$current" == "$selected"* ]]; then
      echo "⚠ Cannot delete current worktree. Use wtdone instead."
      return 1
    fi
    if /usr/bin/git worktree remove $force "$selected" 2>/dev/null; then
      echo "✓ Removed $selected"
    else
      echo "⚠ Worktree has changes. Force delete? [y/N]"
      read -r confirm
      if [[ "$confirm" =~ ^[Yy]$ ]]; then
        /usr/bin/git worktree remove --force "$selected" && echo "✓ Force removed $selected"
      fi
    fi
  fi
}

# gwt shell integration (cd support + completions)
eval "$(command gwt shell-init)"

export XDG_CONFIG_HOME="$HOME/.config"
eval "$(zoxide init zsh)"

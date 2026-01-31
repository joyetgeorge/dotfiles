export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim  

eval "$(starship init zsh)"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

alias c="clear"
alias vim="nvim"
alias gpo='git push origin "$(git symbolic-ref --short HEAD)"'
alias gm="gemini"
alias nn="nvim"
alias lg="lazygit"
alias zj="zellij"

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

znf() {
  local dir file

  while true; do
    # --- Project picker ---
    dir=$(
      zoxide query -l \
      | sed "s|^$HOME/||" \
      | awk '{ print "󰉋 " $0 }' \
      | fzf --ansi \
            --height=40% \
            --layout=reverse-list \
            --prompt="❯ " \
            --delimiter=' ' \
            --nth=2.. \
            --preview "ls -la $HOME/{2}"
    ) || return

    dir="$HOME/$(echo "$dir" | cut -d' ' -f2-)"

    # --- File picker ---
    file=$(
      eza --icons=always \
          --color=always \
          --all \
          --git-ignore \
          --absolute \
          --oneline \
          "$dir" \
      | awk '
          {
            path=$NF
            name=path
            sub(".*/","",name)
            icon=$1
            print icon "  " name "  " path
          }
        ' \
      | fzf --ansi \
            --layout=reverse-list \
            --delimiter='  ' \
            --with-nth=1,2 \
            --nth=2 \
            --prompt="❯ " \
            --bind 'ctrl-b:abort' \
            --preview "
              if [ -d {3} ]; then
                eza --icons=always --color=always --all {3}
              else
                bat --style=plain --paging=never --color=always {3}
              fi
            "
    )

    # Ctrl-B → back
    if [ $? -ne 0 ]; then
      continue
    fi

    nvim "$(echo "$file" | awk -F'  ' '{print $3}')"
    return
  done
}

fe() {
  local file
  file=$(fzf --preview 'bat --style=numbers --color=always {}') || return
  nvim "$file"
}

export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border
  --margin=1
  --padding=1
  --info=inline
  --ansi

  --prompt="󰍉 "
  --pointer="❯"
  --marker="󰄬"
  --separator="─"
  --scrollbar=""

  --color=bg:#121f1d,bg+:#121f1d
  --color=fg:#b8d6cf,fg+:#e6f6f1

  --color=hl:#18B06A,hl+:#18B06A
  --color=prompt:#18B06A
  --color=pointer:#18B06A
  --color=marker:#18B06A
  --color=spinner:#18B06A

  --color=border:#29413B
  --color=label:#29413B

  --color=info:#5fd7a7
  --color=header:#5fd7a7

  --bind=ctrl-j:down,ctrl-k:up,ctrl-d:half-page-down,ctrl-u:half-page-up

  --preview "([[ -d {} ]] && ls -la {}) || bat --style=plain --paging=never {}"
  --preview-window=right:60%:wrap:noinfo
'

export XDG_CONFIG_HOME="$HOME/.config"
eval "$(zoxide init zsh)"

# opencode
export PATH=/Users/joyetgeorge/.opencode/bin:$PATH

_fix_cursor() { echo -ne '\e[2 q' }
precmd_functions+=(_fix_cursor)

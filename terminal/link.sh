#!/usr/bin/env bash
set -euo pipefail

# Resolve repo root as the directory containing this script
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp() { date +%Y%m%d_%H%M%S; }

backup_if_needed() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    local backup="${target}.backup.$(timestamp)"
    echo "📦 Backing up $target -> $backup"
    mv "$target" "$backup"
  fi
}

replace_symlink() {
  local src="$1"
  local dst="$2"

  if [[ ! -e "$src" ]]; then
    echo "❌ Source not found: $src"
    exit 1
  fi

  mkdir -p "$(dirname "$dst")"

  backup_if_needed "$dst"

  if [[ -L "$dst" ]]; then
    echo "🔁 Removing existing symlink: $dst"
    rm "$dst"
  elif [[ -e "$dst" ]]; then
    # If we get here, it's a non-symlink existing file, but backup_if_needed should have moved it.
    echo "❌ Unexpected: $dst still exists and is not a symlink."
    exit 1
  fi

  echo "🔗 Linking: $dst -> $src"
  ln -s "$src" "$dst"
}

echo "Repo root: $REPO_ROOT"

# --- zsh ---
ZSH_SRC="$REPO_ROOT/zsh/zshrc"
ZSH_DST="$HOME/.zshrc"
replace_symlink "$ZSH_SRC" "$ZSH_DST"

# --- vim ---
VIM_SRC="$REPO_ROOT/vim/vimrc"
VIM_DST="$HOME/.vimrc"
replace_symlink "$VIM_SRC" "$VIM_DST"

# --- tmux ---
TMUX_SRC="$REPO_ROOT/tmux/tmux.conf"
TMUX_DST="$HOME/.tmux.conf"
replace_symlink "$TMUX_SRC" "$TMUX_DST"

# --- starship ---
STARSHIP_SRC="$REPO_ROOT/starship/starship.toml"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
STARSHIP_DST="$HOME/.config/starship.toml"
replace_symlink "$STARSHIP_SRC" "$STARSHIP_DST"

echo "✅ All links created."

# Helpful reload hints (non-fatal)
if [[ -n "${TMUX:-}" ]]; then
  echo "🔄 Reload tmux: tmux source-file ~/.tmux.conf"
else
  echo "ℹ️ Reload tmux later with: tmux source-file ~/.tmux.conf"
fi

echo "ℹ️ Reload zsh with: source ~/.zshrc (or open a new terminal)"
echo "ℹ️ Starship will pick up config next time your prompt renders"


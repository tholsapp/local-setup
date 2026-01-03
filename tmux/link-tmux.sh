#!/usr/bin/env bash
set -euo pipefail

# Directory where this script lives (your repo tmux folder)
TMUX_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change this if your repo uses a different filename
REPO_CONFIG_FILE="$TMUX_DIR/tmux.conf"

HOME_CONFIG_FILE="$HOME/.tmux.conf"
BACKUP_FILE="$HOME/.tmux.conf.backup.$(date +%Y%m%d_%H%M%S)"

echo "Repo config: $REPO_CONFIG_FILE"
echo "Home config: $HOME_CONFIG_FILE"

if [[ ! -f "$REPO_CONFIG_FILE" ]]; then
  echo "❌ Expected tmux config not found:"
  echo "   $REPO_CONFIG_FILE"
  echo "If your repo file has a different name, update REPO_CONFIG_FILE in link.sh"
  exit 1
fi

# Backup existing home config if it exists and is not a symlink
if [[ -e "$HOME_CONFIG_FILE" && ! -L "$HOME_CONFIG_FILE" ]]; then
  echo "📦 Backing up existing ~/.tmux.conf to:"
  echo "   $BACKUP_FILE"
  mv "$HOME_CONFIG_FILE" "$BACKUP_FILE"
fi

# Remove existing symlink if present
if [[ -L "$HOME_CONFIG_FILE" ]]; then
  echo "🔁 Removing existing ~/.tmux.conf symlink"
  rm "$HOME_CONFIG_FILE"
fi

echo "🔗 Creating symlink:"
echo "   $HOME_CONFIG_FILE -> $REPO_CONFIG_FILE"
ln -s "$REPO_CONFIG_FILE" "$HOME_CONFIG_FILE"

echo "✅ Done. ~/.tmux.conf now points to your repo tmux.conf"

# Optional: reload tmux config if we're inside tmux
if [[ -n "${TMUX:-}" ]]; then
  echo "🔄 Reloading tmux config in current session..."
  tmux source-file "$HOME_CONFIG_FILE"
  echo "✅ Reloaded."
else
  echo "ℹ️ Not inside tmux; to reload later run: tmux source-file ~/.tmux.conf"
fi


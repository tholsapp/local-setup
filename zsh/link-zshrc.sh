#!/usr/bin/env bash
set -euo pipefail

# Directory where this script lives (repo zsh folder)
ZSH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Repo config file (adjust name if needed)
REPO_CONFIG_FILE="$ZSH_DIR/zshrc"

HOME_CONFIG_FILE="$HOME/.zshrc"
BACKUP_FILE="$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"

echo "Repo config: $REPO_CONFIG_FILE"
echo "Home config: $HOME_CONFIG_FILE"

if [[ ! -f "$REPO_CONFIG_FILE" ]]; then
  echo "❌ Expected .zshrc not found in repo:"
  echo "   $REPO_CONFIG_FILE"
  exit 1
fi

# Backup existing home config if it exists and is not a symlink
if [[ -e "$HOME_CONFIG_FILE" && ! -L "$HOME_CONFIG_FILE" ]]; then
  echo "📦 Backing up existing ~/.zshrc to:"
  echo "   $BACKUP_FILE"
  mv "$HOME_CONFIG_FILE" "$BACKUP_FILE"
fi

# Remove existing symlink if present
if [[ -L "$HOME_CONFIG_FILE" ]]; then
  echo "🔁 Removing existing ~/.zshrc symlink"
  rm "$HOME_CONFIG_FILE"
fi

echo "🔗 Creating symlink:"
echo "   $HOME_CONFIG_FILE -> $REPO_CONFIG_FILE"
ln -s "$REPO_CONFIG_FILE" "$HOME_CONFIG_FILE"

echo "✅ Done. ~/.zshrc now points to your repo version"

echo "ℹ️ Reload with: source ~/.zshrc (or open a new terminal)"


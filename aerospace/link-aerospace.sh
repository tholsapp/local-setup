#!/usr/bin/env bash
set -euo pipefail

# Directory where this script lives (your repo aerospace folder)
AEROSPACE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

REPO_CONFIG_FILE="$AEROSPACE_DIR/aerospace.toml"
HOME_CONFIG_FILE="$HOME/.aerospace.toml"
BACKUP_FILE="$HOME/.aerospace.toml.backup.$(date +%Y%m%d_%H%M%S)"

echo "Repo config: $REPO_CONFIG_FILE"
echo "Home config: $HOME_CONFIG_FILE"

if [[ ! -f "$REPO_CONFIG_FILE" ]]; then
  echo "❌ Expected config file not found:"
  echo "   $REPO_CONFIG_FILE"
  echo "Make sure your repo has aerospace.toml in the same directory as link.sh"
  exit 1
fi

# Backup existing home config if it exists and is not a symlink
if [[ -e "$HOME_CONFIG_FILE" && ! -L "$HOME_CONFIG_FILE" ]]; then
  echo "📦 Backing up existing ~/.aerospace.toml to:"
  echo "   $BACKUP_FILE"
  mv "$HOME_CONFIG_FILE" "$BACKUP_FILE"
fi

# Remove existing symlink if present
if [[ -L "$HOME_CONFIG_FILE" ]]; then
  echo "🔁 Removing existing ~/.aerospace.toml symlink"
  rm "$HOME_CONFIG_FILE"
fi

echo "🔗 Creating symlink:"
echo "   $HOME_CONFIG_FILE -> $REPO_CONFIG_FILE"
ln -s "$REPO_CONFIG_FILE" "$HOME_CONFIG_FILE"

echo "✅ Done. AeroSpace will now load the repo config via ~/.aerospace.toml"


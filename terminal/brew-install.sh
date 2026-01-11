#!/usr/bin/env bash
set -euo pipefail

echo "🍺 Homebrew bootstrap starting..."

# -----------------------------
# Install Homebrew if missing
# -----------------------------
if ! command -v brew >/dev/null 2>&1; then
  echo "🔧 Homebrew not found. Installing..."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Ensure brew is available in this shell
  if [[ -d "/opt/homebrew/bin" ]]; then
    # Apple Silicon
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -d "/usr/local/bin" ]]; then
    # Intel Mac
    eval "$(/usr/local/bin/brew shellenv)"
  fi
else
  echo "✅ Homebrew already installed"
fi

echo "🍺 Using brew at: $(command -v brew)"

# -----------------------------
# Update brew
# -----------------------------
brew update

# -----------------------------
# Core CLI tools
# -----------------------------
BREW_PACKAGES=(
  git
  gh
  ripgrep
  fd
  fzf
  bat
  eza
  jq
  yq
  wget
  curl
  tree
  tmux
  neovim
  starship
  zoxide
  zsh-autosuggestions
  zsh-syntax-highlighting
)

echo "📦 Installing brew packages..."
for pkg in "${BREW_PACKAGES[@]}"; do
  if brew list "$pkg" >/dev/null 2>&1; then
    echo "✔ $pkg already installed"
  else
    echo "⬇ Installing $pkg"
    brew install "$pkg"
  fi
done

# -----------------------------
# Optional taps / extras
# -----------------------------
# Example:
# brew tap homebrew/cask
# brew install --cask iterm2

echo "✅ Brew bootstrap complete"


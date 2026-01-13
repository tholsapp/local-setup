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
  font-jetbrains-mono-nerd-font
  fzf
  bat
  eza
  jq
  lazygit
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
# Borders (JankyBorders) - requires tapping FelixKratz/formulae
# -----------------------------
BORDERS_TAP="FelixKratz/formulae"
BORDERS_PKG="borders"

echo "🧩 Ensuring tap exists: $BORDERS_TAP"
if brew tap | grep -qx "$BORDERS_TAP"; then
  echo "✔ Tap already added: $BORDERS_TAP"
else
  echo "➕ Tapping $BORDERS_TAP"
  brew tap "$BORDERS_TAP"
fi

echo "🪟 Installing $BORDERS_PKG..."
if brew list "$BORDERS_PKG" >/dev/null 2>&1; then
  echo "✔ $BORDERS_PKG already installed"
else
  echo "⬇ Installing $BORDERS_PKG"
  brew install "$BORDERS_PKG"
fi

echo "✅ Brew bootstrap complete"


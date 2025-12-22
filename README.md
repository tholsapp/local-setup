# Local Development Setup

This repository contains configuration files (dotfiles) and documentation for my mac's local development environment.

## Tools & Configurations

This setup includes configurations for the following tools:

### Window Management
- **[Aerospace](docs/aerospace.md)** - Tiling window manager for macOS
  - Config: [`dotfiles/.aerospace.toml`](dotfiles/.aerospace.toml)

### Terminal & Shell
- **[iTerm2](docs/iterm2.md)** - Terminal emulator for macOS
  - Config: [`dotfiles/iterm2/`](dotfiles/iterm2/)
- **[tmux](docs/tmux.md)** - Terminal multiplexer
  - Config: [`dotfiles/.tmux.conf`](dotfiles/.tmux.conf)
- **[zoxide](docs/zoxide.md)** - Smart directory navigation
  - Documentation: [`docs/zoxide.md`](docs/zoxide.md)

### Editor
- **[vim](docs/vim.md)** - Text editor
  - Config: [`dotfiles/.vimrc`](dotfiles/.vimrc)

### Browser
- **[Vimium](docs/vimium.md)** - Vim-like browser navigation
  - Config: [`dotfiles/vimium-config.txt`](dotfiles/vimium-config.txt)

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/tholsapp/local-setup.git
   cd local-setup
   ```

2. Review the configuration files in the `dotfiles/` directory

3. Symlink or copy the dotfiles you want to use:
   ```bash
   # Example: Link zsh configuration
   ln -s $(pwd)/dotfiles/.zshrc ~/.zshrc
   
   # Example: Link vim configuration
   ln -s $(pwd)/dotfiles/.vimrc ~/.vimrc
   
   # Example: Link tmux configuration
   ln -s $(pwd)/dotfiles/.tmux.conf ~/.tmux.conf
   
   # Example: Link aerospace configuration
   ln -s $(pwd)/dotfiles/.aerospace.toml ~/.aerospace.toml
   ```

4. See individual tool documentation in the [`docs/`](docs/) directory for detailed setup instructions

## Repository Structure

```
local-setup/
├── README.md           # This file
├── dotfiles/           # Configuration files
│   ├── aerospace.toml # Aerospace window manager config
│   ├── vimrc          # Vim configuration
│   ├── zshrc          # Zsh/oh-my-zsh configuration
│   ├── tmux.conf      # Tmux configuration
└── docs/               # Documentation for each tool
    ├── aerospace.md
    ├── iterm2.md
    ├── tmux.md
    ├── vim.md
    ├── vimium.md
    └── zoxide.md

```

## Contributing

These are my personal configurations. Feel free to fork and adapt them to your needs!

## License

MIT

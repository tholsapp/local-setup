# Local Development Setup

This repository contains configuration files (dotfiles) and documentation for my mac's local development environment.

## Tools & Configurations

This setup includes configurations for the following tools:

### Window Management
- **[Aerospace](aerospace/aerospace.md)** - Tiling window manager for macOS
  - Config: [`aerospace/aerospace.toml`](aerospace/aerospace.toml)

### Terminal & Shell
- **[iTerm2](docs/iterm2.md)** - Terminal emulator for macOS
  - Documentation: [`docs/iterm2.md`](docs/iterm2.md)
- **[tmux](terminal/tmux/tmux.md)** - Terminal multiplexer
  - Config: [`terminal/tmux/tmux.conf`](terminal/tmux/tmux.conf)
- **[zsh](terminal/zsh/zshrc)** - Z shell configuration
  - Config: [`terminal/zsh/zshrc`](terminal/zsh/zshrc)
- **[Starship](terminal/starship/starship.toml)** - Cross-shell prompt
  - Config: [`terminal/starship/starship.toml`](terminal/starship/starship.toml)
- **[zoxide](docs/zoxide.md)** - Smart directory navigation
  - Documentation: [`docs/zoxide.md`](docs/zoxide.md)

### Browser
- **[Vimium](docs/vimium.md)** - Vim-like browser navigation
  - Documentation: [`docs/vimium.md`](docs/vimium.md)

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/tholsapp/local-setup.git
   cd local-setup
   ```

2. Use the provided link scripts to symlink configurations:
   ```bash
   # Link terminal configurations (zsh, tmux, starship)
   cd terminal
   ./link.sh
   
   # Link aerospace configuration
   cd ../aerospace
   ./link-aerospace.sh
   ```
   
   Or manually symlink individual configs:
   ```bash
   # Example: Link zsh configuration
   ln -s $(pwd)/terminal/zsh/zshrc ~/.zshrc
   
   # Example: Link tmux configuration
   ln -s $(pwd)/terminal/tmux/tmux.conf ~/.tmux.conf
   
   # Example: Link starship configuration
   ln -s $(pwd)/terminal/starship/starship.toml ~/.config/starship.toml
   
   # Example: Link aerospace configuration
   ln -s $(pwd)/aerospace/aerospace.toml ~/.aerospace.toml
   ```

3. See individual tool documentation:
   - Aerospace: [`aerospace/aerospace.md`](aerospace/aerospace.md)
   - tmux: [`terminal/tmux/tmux.md`](terminal/tmux/tmux.md)
   - iTerm2: [`docs/iterm2.md`](docs/iterm2.md)
   - Vimium: [`docs/vimium.md`](docs/vimium.md)
   - Zoxide: [`docs/zoxide.md`](docs/zoxide.md)

## Repository Structure

```
local-setup/
├── README.md              # This file
├── aerospace/             # Aerospace window manager
│   ├── aerospace.md       # Aerospace documentation
│   ├── aerospace.toml     # Aerospace configuration
│   └── link-aerospace.sh  # Installation script
├── terminal/              # Terminal configurations
│   ├── link.sh           # Installation script for all terminal configs
│   ├── starship/
│   │   └── starship.toml # Starship prompt configuration
│   ├── tmux/
│   │   ├── tmux.conf     # Tmux configuration
│   │   └── tmux.md       # Tmux documentation
│   └── zsh/
│       └── zshrc         # Zsh configuration
└── docs/                  # Additional documentation
    ├── iterm2.md         # iTerm2 setup guide
    ├── vimium.md         # Vimium browser extension guide
    └── zoxide.md         # Zoxide directory navigation guide

```

## Contributing

These are my personal configurations. Feel free to fork and adapt them to your needs!

## License

MIT

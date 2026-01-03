# Local Development Setup

This repository contains configuration files and documentation for my mac's local development environment.

## Tools & Configurations

This setup includes configurations for the following tools:

### Window Management
- **[Aerospace](aerospace/aerospace.md)** - Tiling window manager for macOS
  - Config: [`aerospace/aerospace.toml`](aerospace/aerospace.toml)

### Terminal & Shell
- **[tmux](terminal/tmux/tmux.md)** - Terminal multiplexer
  - Config: [`terminal/tmux/tmux.conf`](terminal/tmux/tmux.conf)
- **[zsh](terminal/zsh/zshrc)** - Shell configuration
  - Config: [`terminal/zsh/zshrc`](terminal/zsh/zshrc)
- **[Starship](https://starship.rs)** - Cross-shell prompt
  - Config: [`terminal/starship/starship.toml`](terminal/starship/starship.toml)

### Browser & Navigation
- **[Vimium](docs/vimium.md)** - Vim-like browser navigation
- **[Zoxide](docs/zoxide.md)** - Smart directory navigation

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/tholsapp/local-setup.git
   cd local-setup
   ```

2. Review the configuration files in their respective directories

3. Link the configurations you want to use:
   
   **For terminal tools (zsh, tmux, starship):**
   ```bash
   cd terminal
   ./link.sh
   ```
   
   **For Aerospace:**
   ```bash
   cd aerospace
   ./link-aerospace.sh
   ```

4. See individual tool documentation files for detailed setup and usage instructions

## Repository Structure

```
local-setup/
├── README.md              # This file
├── aerospace/             # Window manager configuration
│   ├── aerospace.md       # Documentation
│   ├── aerospace.toml     # Configuration file
│   └── link-aerospace.sh  # Setup script
├── terminal/              # Terminal and shell configurations
│   ├── link.sh            # Setup script for terminal tools
│   ├── starship/          # Prompt configuration
│   │   └── starship.toml
│   ├── tmux/              # Terminal multiplexer
│   │   ├── tmux.conf
│   │   └── tmux.md        # Documentation
│   └── zsh/               # Shell configuration
│       └── zshrc
└── docs/                  # Additional documentation
    ├── iterm2.md
    ├── vimium.md
    └── zoxide.md
```

## Contributing

These are my personal configurations. Feel free to fork and adapt them to your needs!

## License

MIT

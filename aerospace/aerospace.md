# Aerospace Window Manager

## Overview
Aerospace is a tiling window manager for macOS that allows you to manage windows using keyboard shortcuts, similar to i3 or sway on Linux.

## Installation

```bash
# Using Homebrew
brew install --cask nikitabobko/tap/aerospace
```

## Configuration

The configuration file is located at: [`../dotfiles/.aerospace.toml`](../dotfiles/.aerospace.toml)

To use this configuration:

```bash
# Create symlink to the configuration
ln -s $(pwd)/dotfiles/.aerospace.toml ~/.aerospace.toml

# Or copy the file
cp dotfiles/.aerospace.toml ~/.aerospace.toml
```

## Key Bindings

### Focus Navigation
- `Alt + H` - Focus left
- `Alt + J` - Focus down
- `Alt + K` - Focus up
- `Alt + L` - Focus right

### Moving Windows
- `Alt + Shift + H` - Move window left
- `Alt + Shift + J` - Move window down
- `Alt + Shift + K` - Move window up
- `Alt + Shift + L` - Move window right

### Workspaces
- `Alt + 1-9` - Switch to workspace 1-9
- `Alt + Shift + 1-9` - Move window to workspace 1-9

### Layout
- `Alt + F` - Toggle fullscreen
- `Alt + Shift + Space` - Toggle floating/tiling
- `Alt + S` - Horizontal split layout
- `Alt + V` - Vertical split layout

### Resize Mode
- `Alt + R` - Enter resize mode
  - In resize mode:
    - `H` - Decrease width
    - `J` - Increase height
    - `K` - Decrease height
    - `L` - Increase width
    - `Enter` or `Esc` - Exit resize mode

### Service Mode
- `Alt + Shift + ;` - Enter service mode
  - In service mode:
    - `Esc` - Reload configuration
    - `R` - Reset layout
    - `Backspace` - Close all windows except current

## Features

- **Automatic Tiling**: Windows automatically arrange themselves
- **Multiple Workspaces**: Organize windows across multiple virtual desktops
- **Gaps**: Configurable gaps between windows for visual appeal
- **Normalization**: Automatically optimizes window layouts
- **Mouse Support**: Mouse follows focus when switching monitors

## Configuration Highlights

```toml
# Start at login
start-at-login = true

# Window gaps (in pixels)
[gaps]
inner.horizontal = 10
inner.vertical = 10
outer.left = 10
outer.bottom = 10
outer.top = 10
outer.right = 10
```

## Tips

1. **Learning Curve**: Take time to learn the keybindings - they'll become second nature
2. **Customize**: Adjust the configuration file to match your workflow
3. **Workspaces**: Use different workspaces for different tasks (coding, communication, browsing)
4. **Floating Windows**: Some apps (like Settings) work better in floating mode

## Resources

- [Official Documentation](https://nikitabobko.github.io/AeroSpace/guide)
- [GitHub Repository](https://github.com/nikitabobko/AeroSpace)

## Troubleshooting

### Reload Configuration
After making changes to `.aerospace.toml`:
- Use `Alt + Shift + ;` then `Esc` to reload
- Or restart Aerospace from the menu bar

### Check Status
- Look for the Aerospace icon in the menu bar
- Right-click for options and diagnostics

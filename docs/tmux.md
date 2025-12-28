# tmux

## Overview
tmux is a terminal multiplexer that allows you to switch between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal.

## Installation

```bash
# Using Homebrew
brew install tmux
```

## Configuration

The configuration file is located at: [`../dotfiles/.tmux.conf`](../dotfiles/.tmux.conf)

To use this configuration:

```bash
# Create symlink to the configuration
ln -s $(pwd)/dotfiles/.tmux.conf ~/.tmux.conf

# Or copy the file
cp dotfiles/.tmux.conf ~/.tmux.conf

# Reload configuration (in tmux session)
tmux source-file ~/.tmux.conf
```

Or use the keyboard shortcut: `Ctrl-a` then `r`

## Key Concepts

- **Prefix**: The key combination that precedes tmux commands (default: `Ctrl-a` in this config)
- **Session**: A collection of windows
- **Window**: Like a tab in a browser
- **Pane**: Split section of a window

## Key Bindings

### Prefix Key
The prefix has been changed from `Ctrl-b` to `Ctrl-a` for easier reach.

### Session Management
```bash
# Start new session
tmux new -s session-name

# List sessions
tmux ls

# Attach to session
tmux attach -t session-name

# Detach from session
Prefix + d

# Switch between sessions
Prefix + s
```

### Window Management
- `Prefix + c` - Create new window
- `Prefix + ,` - Rename window
- `Prefix + &` - Kill window
- `Prefix + n` - Next window
- `Prefix + p` - Previous window
- `Prefix + 0-9` - Switch to window number
- `Ctrl-h` / `Ctrl-l` - Previous/Next window (no prefix needed)

### Pane Management

#### Creating Panes
- `Prefix + |` - Split vertically
- `Prefix + -` - Split horizontally

#### Navigating Panes
- `Prefix + h` - Move to left pane
- `Prefix + j` - Move to down pane
- `Prefix + k` - Move to up pane
- `Prefix + l` - Move to right pane
- `Prefix + o` - Next pane
- `Prefix + ;` - Toggle last pane

#### Resizing Panes
- `Prefix + H` - Resize left (repeatable)
- `Prefix + J` - Resize down (repeatable)
- `Prefix + K` - Resize up (repeatable)
- `Prefix + L` - Resize right (repeatable)

#### Other Pane Commands
- `Prefix + x` - Kill pane
- `Prefix + z` - Toggle pane zoom (fullscreen)
- `Prefix + space` - Toggle pane layouts
- `Prefix + {` - Swap pane with previous
- `Prefix + }` - Swap pane with next

### Copy Mode (Vi-style)
- `Prefix + [` - Enter copy mode
- In copy mode:
  - `v` - Begin selection
  - `y` - Copy selection and exit
  - `q` or `Esc` - Exit copy mode
  - Use vim motions: `h`, `j`, `k`, `l`, `w`, `b`, `/`, `?`, etc.

### Other Useful Commands
- `Prefix + ?` - List all key bindings
- `Prefix + t` - Show clock
- `Prefix + r` - Reload configuration
- `Prefix + :` - Enter command mode

## Configuration Highlights

### Mouse Support
Mouse support is enabled. You can:
- Click to switch panes
- Drag to resize panes
- Scroll to navigate history
- Click to switch windows in status bar

### Visual Settings
- 256 color support
- Custom status bar with time and date
- Highlighted active pane border
- Custom window status formats

### Behavior
- Windows are renumbered when one is closed
- Windows/panes numbering starts at 1
- New panes/windows open in the current directory
- 10,000 lines of scrollback history

## Common Workflows

### Development Workflow
```bash
# Start a new session for a project
tmux new -s myproject

# Create windows for different tasks
Prefix + c  # for editing
Prefix + c  # for running server
Prefix + c  # for tests

# In the editing window, split for multiple files
Prefix + |  # vertical split
Prefix + -  # horizontal split
```

### Remote Session
```bash
# SSH into remote server
ssh user@server

# Start or attach to tmux session
tmux new -s work
# or
tmux attach -t work

# Do your work, then detach
Prefix + d

# Exit SSH
exit

# Later, SSH back and reattach
ssh user@server
tmux attach -t work
# Your session is exactly as you left it!
```

## Tmux Plugin Manager (TPM)

To extend tmux functionality, install TPM:

```bash
# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Uncomment the plugin section in `.tmux.conf`:
```bash
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

run '~/.tmux/plugins/tpm/tpm'
```

### Recommended Plugins
- **tmux-sensible**: Basic sensible settings
- **tmux-resurrect**: Save/restore sessions
- **tmux-continuum**: Continuous saving of sessions
- **tmux-yank**: Better clipboard integration
- **tmux-open**: Open highlighted files/URLs

### Using TPM
- `Prefix + I` - Install plugins
- `Prefix + U` - Update plugins
- `Prefix + alt + u` - Uninstall plugins

## Tips and Tricks

1. **Pair Programming**: Multiple users can connect to the same session
2. **Synchronized Panes**: `Prefix + :set synchronize-panes on` - type in all panes simultaneously
3. **Command History**: In command mode (`:`) use up/down arrows
4. **Swap Windows**: `Prefix + :swap-window -s 2 -t 1`
5. **Move Window**: `Prefix + :move-window -t session-name:1`
6. **Break Pane**: `Prefix + !` - turn pane into window
7. **Join Pane**: `Prefix + :join-pane -s source-window:pane`

## Useful Commands

```bash
# List all sessions
tmux ls

# Kill a session
tmux kill-session -t session-name

# Kill all sessions except current
tmux kill-session -a

# Create named session
tmux new -s project-name

# Create session with specific window name
tmux new -s session-name -n window-name

# Attach to most recent session
tmux attach
# or
tmux a

# Rename session
tmux rename-session -t old-name new-name
# or (inside session)
Prefix + $
```

## Resources

- [Official Website](https://github.com/tmux/tmux)
- [tmux Cheat Sheet](https://tmuxcheatsheet.com/)
- [TPM - Plugin Manager](https://github.com/tmux-plugins/tpm)
- [Awesome tmux](https://github.com/rothgar/awesome-tmux)

## Troubleshooting

### Colors Not Working
Ensure your terminal supports 256 colors and add to `.zshrc`:
```bash
export TERM=xterm-256color
```

### Clipboard Not Working on macOS
Install `reattach-to-user-namespace`:
```bash
brew install reattach-to-user-namespace
```

### Mouse Mode Issues
If mouse mode interferes with text selection:
- Hold `Option` (macOS) or `Shift` (Linux) while selecting text

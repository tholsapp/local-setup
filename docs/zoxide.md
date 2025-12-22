# Zoxide

## Overview
Zoxide is a smarter `cd` command that learns your habits and lets you navigate to directories by typing just a few characters. It's inspired by z and autojump but faster and more efficient.

## Installation

```bash
# Using Homebrew (macOS/Linux)
brew install zoxide
```

## Configuration

Zoxide is already configured in the `.zshrc` file: [`../dotfiles/.zshrc`](../dotfiles/.zshrc)

The relevant line is:
```bash
eval "$(zoxide init zsh)"
```

For other shells:

### Bash
Add to `~/.bashrc`:
```bash
eval "$(zoxide init bash)"
```

### Fish
Add to `~/.config/fish/config.fish`:
```fish
zoxide init fish | source
```

### PowerShell
Add to your PowerShell profile:
```powershell
Invoke-Expression (& { (zoxide init powershell | Out-String) })
```

## Usage

### Basic Commands

#### z - Jump to Directory
```bash
# Jump to a directory that contains "foo"
z foo

# Jump to a directory that contains "foo" and "bar"
z foo bar

# Jump to the highest ranked directory matching "foo"
z foo
```

#### zi - Interactive Selection
```bash
# Interactively select from multiple matches
zi foo

# Use arrow keys to select, Enter to confirm
```

#### za - Add Directory
```bash
# Manually add a directory to the database
za /path/to/directory
```

#### zr - Remove Directory
```bash
# Remove a directory from the database
zr /path/to/directory
```

#### zq - Query
```bash
# Query the database (doesn't change directory)
zq foo

# Show score and path
zq foo --list
```

### Examples

```bash
# Traditional cd
cd ~/projects/work/my-awesome-project

# With zoxide (after visiting once)
z awesome

# Or even shorter
z awe

# Multiple keywords
z work awesome

# Interactive selection when multiple matches
zi proj
```

## How It Works

### Frecency Algorithm
Zoxide uses a "frecency" algorithm that combines:
- **Frequency**: How often you visit a directory
- **Recency**: How recently you visited a directory

Directories you visit more frequently and more recently get higher scores.

### Learning
Zoxide automatically learns as you navigate:
- Every time you `cd` to a directory, zoxide records it
- Scores increase with each visit
- Scores decay over time for less-visited directories

### Matching
Zoxide matches directories using:
- Substring matching
- Fuzzy matching for typos
- Multiple keywords (space-separated)
- Case-insensitive by default

## Advanced Usage

### Environment Variables

```bash
# Change data directory
export _ZO_DATA_DIR="$HOME/.local/share"

# Exclude directories from being added
export _ZO_EXCLUDE_DIRS="$HOME:$HOME/Downloads"

# Maximum number of results for `zi`
export _ZO_MAXAGE=10000

# When set, zoxide will resolve symlinks
export _ZO_RESOLVE_SYMLINKS=1
```

### Custom Aliases

Add to your `.zshrc` or `.bashrc`:

```bash
# Use 'j' instead of 'z' (like autojump)
alias j='z'

# Go to parent directory with pattern
alias zp='z ..'

# List all directories in database
alias zl='zoxide query -l'
```

### Integration with Other Tools

#### fzf Integration
For better interactive selection with fzf:

```bash
# Install fzf
brew install fzf

# In your shell config
export _ZO_FZF_OPTS="--height=40% --layout=reverse --border"
```

#### cd Replacement
If you want `cd` to use zoxide:

```bash
# Add to .zshrc (use with caution)
cd() {
  if [ $# -eq 0 ]; then
    z ~
  else
    z "$@"
  fi
}
```

## Tips and Tricks

1. **Start Using It Immediately**: Just use `cd` normally for a few days, then start using `z`
2. **Partial Matching**: You don't need to type the full directory name
3. **Multiple Keywords**: Use multiple keywords to narrow down matches
4. **Interactive Mode**: Use `zi` when you're not sure which directory you want
5. **Keep Database Clean**: Use `zr` to remove directories you no longer use
6. **Tab Completion**: Zoxide supports tab completion (configure in your shell)

## Common Workflows

### Project Navigation
```bash
# Navigate to various projects
z frontend
z backend
z docs
z config

# Quick switch between related projects
z proj api
z proj web
z proj mobile
```

### Deep Directory Structures
```bash
# Instead of:
cd ~/work/company/team/project/src/components/buttons

# Just use:
z buttons

# Or be more specific:
z project buttons
```

### Multiple Matches
```bash
# When you have multiple matching directories
zi proj          # Opens interactive selector
# Use arrow keys to choose
```

## Comparison with Alternatives

### vs. autojump
- Zoxide is faster (written in Rust)
- Better matching algorithm
- More actively maintained

### vs. z
- Zoxide is faster
- Better Windows support
- More features (interactive mode, etc.)

### vs. fasd
- Zoxide focuses only on directories (simpler)
- Faster and more reliable

## Shell Completions

### Zsh
Tab completion should work automatically with oh-my-zsh.

### Bash
Add to `.bashrc`:
```bash
eval "$(zoxide init bash)"
```

### Fish
Completions work automatically after initialization.

## Commands Reference

```bash
z <KEYWORDS>...       # Navigate to highest ranked directory
zi <KEYWORDS>...      # Interactive selection
za <PATH>             # Add a directory
zr <PATH>             # Remove a directory
zq <KEYWORDS>...      # Query database
zq -l                 # List all directories with scores
zq -ls                # List all directories with scores (sorted)
```

## Database Management

### View Database
```bash
# List all directories and scores
zq -l

# List sorted by score
zq -ls
```

### Backup Database
```bash
# Database location
ls ~/.local/share/zoxide/data.txt

# Backup
cp ~/.local/share/zoxide/data.txt ~/zoxide-backup.txt
```

### Import/Export
```bash
# Export
zoxide query -l > zoxide-export.txt

# Import (manual)
# Edit data.txt directly at ~/.local/share/zoxide/data.txt
```

## Troubleshooting

### Zoxide Not Working
Check if it's initialized:
```bash
# In your shell config (.zshrc, .bashrc, etc.)
eval "$(zoxide init zsh)"  # or bash, fish, etc.
```

### Wrong Directory Selected
```bash
# Use interactive mode
zi keyword

# Or be more specific
z more specific keywords

# Or remove incorrect entry
zr /wrong/path
```

### Database Corrupted
```bash
# Remove database
rm ~/.local/share/zoxide/data.txt

# Zoxide will create a new one
# You'll need to rebuild your history
```

### Not Learning New Directories
Make sure you're using `cd`, not just shell functions or other tools.

## Resources

- [Official GitHub](https://github.com/ajeetdsouza/zoxide)
- [Official Documentation](https://github.com/ajeetdsouza/zoxide#readme)
- [Comparison with Alternatives](https://github.com/ajeetdsouza/zoxide/wiki/Comparison-with-other-tools)

## Pro Tips

1. **Visit Once, Jump Forever**: Visit directories normally once, then use zoxide forever
2. **Combine with fzf**: For the best interactive experience
3. **Clean Regularly**: Remove old/unused directories to keep database relevant
4. **Use Descriptive Names**: Projects with unique names are easier to jump to
5. **Keywords Order Doesn't Matter**: `z foo bar` and `z bar foo` work the same

## Integration Examples

### With tmux
```bash
# Quick project switcher
alias tproj='tmux new-session -s $(basename $(z -e $1)) -c $(z -e $1)'
```

### With git
```bash
# Jump to git root
alias groot='cd $(git rev-parse --show-toplevel)'
```

### With fzf
```bash
# Interactive directory jumper with preview
alias zf='cd $(zoxide query -l | fzf --preview "ls -la {}")'
```

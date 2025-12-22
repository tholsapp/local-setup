# iTerm2 Configuration

## About
This directory contains iTerm2 configuration and setup information.

## Exporting Your Current iTerm2 Settings

To export your iTerm2 settings and profiles:

1. Open iTerm2
2. Go to **Preferences** (⌘ + ,)
3. Navigate to **General** → **Preferences**
4. Check "Load preferences from a custom folder or URL"
5. Click "Browse" and select this directory: `dotfiles/iterm2/`
6. Optionally enable "Save changes to folder when iTerm2 quits"

## Importing Settings

To import these settings on a new machine:

1. Open iTerm2
2. Go to **Preferences** (⌘ + ,)
3. Navigate to **General** → **Preferences**
4. Check "Load preferences from a custom folder or URL"
5. Click "Browse" and select the `dotfiles/iterm2/` directory
6. Restart iTerm2

## Recommended Settings

### General
- **Working Directory**: Reuse previous session's directory
- **Selection**: Copy to pasteboard on selection

### Appearance
- **Theme**: Minimal or Compact
- **Tab bar location**: Top
- **Status bar location**: Bottom

### Profiles
- **Colors**: Use Solarized Dark or custom color scheme
- **Text**: 
  - Font: MesloLGS NF (recommended for Powerlevel10k)
  - Size: 13pt
  - Anti-aliased
- **Window**:
  - Transparency: 10-15%
  - Blur: Slightly enabled
  - Columns: 120
  - Rows: 35
- **Terminal**:
  - Scrollback lines: 10000
  - Character encoding: UTF-8
- **Keys**:
  - Use Option as Meta key
  - Natural Text Editing enabled

### Keys (Shortcuts)
- **⌘ + D**: Split Vertically
- **⌘ + Shift + D**: Split Horizontally
- **⌘ + ]**: Next Pane
- **⌘ + [**: Previous Pane
- **⌘ + W**: Close Pane
- **⌘ + T**: New Tab
- **⌘ + Number**: Switch to Tab

## Color Schemes

Popular color schemes to consider:
- **Solarized Dark**
- **Dracula**
- **Nord**
- **One Dark**
- **Gruvbox**

Download color schemes from: https://iterm2colorschemes.com/

## Font Recommendations

For best compatibility with oh-my-zsh themes and powerline:
- **MesloLGS NF** (recommended for Powerlevel10k)
- **Fira Code**
- **JetBrains Mono**
- **Cascadia Code**
- **Source Code Pro**

## Tips

1. **Natural Text Editing**: Enable this in Profiles → Keys to use Option + Arrow keys for word navigation
2. **Status Bar**: Configure a status bar with useful widgets (CPU, memory, git branch)
3. **Hotkey Window**: Set up a hotkey window for quick terminal access
4. **Automatic Profile Switching**: Create different profiles for different tasks
5. **Shell Integration**: Enable Shell Integration for additional features

## Note

Since iTerm2 stores its preferences in binary plist format, the actual configuration files may not be human-readable. For version control, you can:

1. Export preferences to a custom folder (this directory)
2. Or use JSON format by converting plists:
   ```bash
   plutil -convert json com.googlecode.iterm2.plist -o iterm2-settings.json
   ```

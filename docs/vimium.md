# Vimium

## Overview
Vimium is a Chrome/Firefox extension that provides keyboard shortcuts for navigation and control in the spirit of Vim.

## Installation

### Chrome/Chromium
1. Visit the [Chrome Web Store](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)
2. Click "Add to Chrome"

### Firefox
1. Visit [Firefox Add-ons](https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/)
2. Click "Add to Firefox"

### Safari
Vimium is not available for Safari. Consider alternatives like:
- Vimari
- Surfingkeys

## Configuration

The configuration file is located at: [`../dotfiles/vimium-config.txt`](../dotfiles/vimium-config.txt)

To import this configuration:
1. Click the Vimium icon in your browser
2. Click "Options"
3. Copy the contents of `vimium-config.txt`
4. Paste into the appropriate sections in Vimium options

## Key Bindings

### Navigation
- `j` - Scroll down
- `k` - Scroll up
- `h` - Scroll left
- `l` - Scroll right
- `d` - Scroll down half page (Ctrl-d)
- `u` - Scroll up half page (Ctrl-u)
- `gg` - Scroll to top
- `G` - Scroll to bottom
- `zH` - Scroll all the way left
- `zL` - Scroll all the way right

### Links and Tabs
- `f` - Show link hints (open in current tab)
- `F` - Show link hints (open in new tab)
- `o` - Open URL or search from omnibar
- `O` - Open URL or search in new tab
- `b` - Open bookmark
- `B` - Open bookmark in new tab
- `T` - Search through open tabs

### Tab Management
- `J` or `gT` - Previous tab
- `K` or `gt` - Next tab
- `g0` - First tab
- `g$` - Last tab
- `t` - Create new tab
- `x` - Close current tab
- `X` - Restore closed tab
- `W` - Move tab to new window
- `<<` - Move tab left
- `>>` - Move tab right
- `yt` - Duplicate current tab
- `^` - Go to previously visited tab

### History Navigation
- `H` - Go back in history
- `L` - Go forward in history

### Page Actions
- `r` - Reload page
- `yy` - Copy current URL to clipboard
- `yf` - Copy link URL to clipboard
- `p` - Open clipboard URL in current tab
- `P` - Open clipboard URL in new tab
- `i` - Enter insert mode (disable Vimium)
- `v` - Enter visual mode (select text)
- `V` - Enter visual line mode
- `gi` - Focus first text input
- `gf` - Select next frame
- `gF` - Select main/top frame

### Finding
- `/` - Enter find mode
- `n` - Next match
- `N` - Previous match

### Marks
- `ma` - Create mark 'a'
- `` `a `` - Go to mark 'a'
- `` ` `` - Go to previous position

### Miscellaneous
- `?` - Show help
- `gs` - View page source
- `gu` - Go up one level in URL hierarchy
- `gU` - Go to root of URL

## Custom Search Engines

Add these to Vimium's search engines setting:

```
g: https://www.google.com/search?q=%s Google
y: https://www.youtube.com/results?search_query=%s YouTube
gh: https://github.com/search?q=%s GitHub
so: https://stackoverflow.com/search?q=%s Stack Overflow
w: https://en.wikipedia.org/w/index.php?search=%s Wikipedia
a: https://www.amazon.com/s?k=%s Amazon
r: https://www.reddit.com/search?q=%s Reddit
m: https://www.google.com/maps/search/%s Google Maps
d: https://duckduckgo.com/?q=%s DuckDuckGo
```

Usage:
- `o gh vimium` - Search GitHub for "vimium"
- `O w vim` - Search Wikipedia for "vim" in new tab

## Excluded Sites

Some sites work better without Vimium. Add these to excluded URLs:

```
https?://mail.google.com/*
https?://docs.google.com/*
https?://www.google.com/maps/*
https?://calendar.google.com/*
https?://trello.com/*
https?://www.notion.so/*
```

You can temporarily disable Vimium on any page with `i` (insert mode).

## Link Hints

Link hints are one of Vimium's most powerful features:

- `f` - Show hints for links, open in current tab
- `F` - Show hints for links, open in new tab
- `yf` - Show hints to copy link URL

After pressing `f` or `F`:
1. Type the letters shown on the link you want
2. Link opens automatically when unique

### Link Hint Characters
The default character set: `sadfjklewcmpgh`
(Optimized for home row typing)

## Visual Mode

Select text without using the mouse:

- `v` - Enter visual mode
- Use vim motions (`h`, `j`, `k`, `l`, `w`, `b`, `e`, etc.) to extend selection
- `y` - Yank (copy) selected text
- `p` - Search for selected text
- `Esc` - Exit visual mode

## Advanced Features

### Omnibar
Press `o` or `O` to open the omnibar:
- Type URL to navigate
- Type search query to search (using default search engine)
- Prefix with search engine key (e.g., `g query`, `gh repo`)
- Shows history and bookmark suggestions

### Marks
Navigate to frequently visited positions:
```
ma     - Set local mark 'a'
mA     - Set global mark 'A'
`a     - Jump to local mark 'a'
`A     - Jump to global mark 'A'
```

Local marks are per-page, global marks work across pages.

### Custom Key Mappings

Add custom mappings in Vimium options under "Custom key mappings":

```
# Map Ctrl-d/u to scroll
map <c-d> scrollPageDown
map <c-u> scrollPageUp

# Map space to scroll down
map <space> scrollPageDown

# Unmap a default binding
unmap x
```

## Tips and Tricks

1. **Link Hints**: Master `f` and `F` for keyboard-only browsing
2. **Tab Search**: Use `T` to search and switch between many open tabs
3. **Quick Copy**: `yy` to copy URL, `yf` then link hint to copy link
4. **Bookmark Search**: `b` or `B` for quick bookmark access
5. **Insert Mode**: Press `i` to temporarily disable Vimium on a page
6. **Find Mode**: `/` for in-page search (similar to Ctrl-F)
7. **Visual Mode**: `v` to select text with keyboard
8. **Marks**: Set marks on frequently visited pages for quick return

## Workflow Examples

### Research Workflow
```
o search query      - Search from omnibar
f                   - Follow interesting link
H                   - Go back if not relevant
F                   - Open promising links in new tabs
J/K                 - Switch between tabs
yy                  - Copy URL of useful page
x                   - Close tab when done
```

### Tab Management
```
t                   - New tab
o github my-repo    - Navigate to URL
yt                  - Duplicate tab for testing
K                   - Switch to next tab
x                   - Close tab
X                   - Restore closed tab if needed
```

## Troubleshooting

### Vimium Not Working on a Page
- Some pages (like Chrome Web Store) block extensions
- Try pressing `i` then `Esc` to reset
- Check if page is in excluded URLs list

### Conflicts with Website Shortcuts
- Add site to excluded URLs
- Or use insert mode (`i`) temporarily

### Link Hints Not Showing
- Page may have custom styling interfering
- Try zooming in/out
- Check if Vimium is enabled for the site

## Resources

- [Vimium GitHub](https://github.com/philc/vimium)
- [Vimium Wiki](https://github.com/philc/vimium/wiki)
- [Keyboard Shortcuts Reference](https://github.com/philc/vimium/blob/master/README.md)

## Alternatives

If you want to try alternatives:
- **Surfingkeys** - More features, more complex
- **Tridactyl** - Firefox-specific, Vim-like
- **qutebrowser** - Separate Vim-like browser
- **Vimari** - Safari extension (basic Vimium features)

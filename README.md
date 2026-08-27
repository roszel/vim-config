# vim-config

My personal Vim configuration with modern plugins and clean setup.

## Quick Start

```bash
git clone https://github.com/yourusername/vim-config.git
cp vim-config/.vimrc ~/.vimrc
vim -c PlugInstall -c qa
```

Then open Vim and enjoy!

## Contents

- **`.vimrc`** — Main Vim configuration with vim-plug plugin manager
- **`CLAUDE.md`** — Codebase architecture and configuration notes
- **`PLUGINS_HOTKEYS_GUIDE.md`** — Complete reference for all plugins and hotkeys
- **`README.md`** — This file

## Features

- **Modern async linting** with ALE (Python, Rust, Shell, HTML, CSS)
- **Fuzzy file finder** with fzf (Ctrl+P, Ctrl+B)
- **Git integration** with fugitive and gitgutter
- **Fast text editing** with vim-surround, vim-commentary, vim-closetag
- **Beautiful theme** with gruvbox colorscheme
- **Clean, organized config** with clear sections and documentation

## Plugin List

| Plugin | Purpose |
|--------|---------|
| `fzf` / `fzf.vim` | Fuzzy file/buffer finder |
| `vim-fugitive` | Git commands in Vim |
| `vim-gitgutter` | Show git changes in sign column |
| `vim-surround` | Add/change/delete surrounding characters |
| `vim-commentary` | Toggle comments |
| `emmet-vim` | Fast HTML/CSS abbreviations |
| `vim-closetag` | Auto-close HTML tags |
| `rust.vim` | Rust language support |
| `vim-shellcheck` | Shell script linting |
| `ale` | Async linting & fixing engine |
| `vim-airline` | Status line & tabline |
| `gruvbox` | Color scheme |

## Essential Hotkeys

**File Navigation:**
- `Ctrl+P` — Find files (fzf)
- `Ctrl+B` — Switch buffers (fzf)

**Text Editing:**
- `gcc` — Toggle comment on line
- `cs"'` — Change surrounding quotes
- `ds"` — Delete surrounding quotes

**Git & Linting:**
- `]c` — Jump to next git change
- `[c` — Jump to previous git change
- `]a` — Jump to next ALE error
- `:ALEFix` — Auto-fix issues

See `PLUGINS_HOTKEYS_GUIDE.md` for the complete reference.

## Requirements

- **Vim 8.0+** or **Neovim**
- **vim-plug** (plugin manager, auto-installed)
- **fzf CLI** — `brew install fzf` (Mac) or `apt install fzf` (Linux)
- Optional language tools for ALE:
  - Python: `pip install flake8 pylint black isort`
  - Rust: `cargo install clippy` (usually included)
  - Shell: `apt install shellcheck` (or similar)

## Installation

### Step 1: Clone this repo
```bash
git clone https://github.com/yourusername/vim-config.git ~/my-vim-config
```

### Step 2: Backup your current .vimrc (if you have one)
```bash
cp ~/.vimrc ~/.vimrc.backup
```

### Step 3: Install the new config
```bash
cp ~/my-vim-config/.vimrc ~/.vimrc
```

### Step 4: Install plugins
Open Vim and run:
```vim
:PlugInstall
```

### Step 5: Install fzf (if not already installed)
```bash
# macOS
brew install fzf

# Debian/Ubuntu
sudo apt install fzf

# Other systems
https://github.com/junegunn/fzf#installation
```

## Customization

Edit `~/.vimrc` to customize:
- Change colorscheme (line 96)
- Adjust indentation (lines 57-59)
- Configure ALE linters (lines 119-131)
- Add your own keybindings

For detailed explanations, see `CLAUDE.md`.

## Troubleshooting

**FZF not working?**
- Make sure you have the fzf CLI tool installed (see Requirements)

**ALE not linting?**
- Run `:ALEInfo` to check which linters are enabled
- Install the linter for your language

**Colors look wrong?**
- Try enabling true color: `:set termguicolors`
- Make sure your terminal supports 256 colors or true color

**Want to revert?**
```bash
cp ~/.vimrc.backup ~/.vimrc
```

## Notes

- This is a plain Vim setup (not Neovim-specific), so all plugins work on traditional Vim
- Plugins are installed to `~/.vim/plugged/` by vim-plug
- Configuration is clean and well-commented for easy modification
- Built for macOS, Linux, and BSD systems

## License

Free to use and modify. Inspired by years of Vim configuration experimentation!

---

**Enjoy your Vim setup!** For questions or improvements, check the plugin documentation or the guides included in this repo.

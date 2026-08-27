# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository contains a personal Vim configuration file (`.vimrc`) that sets up Vim with plugins, themes, and customizations for development work across multiple languages.

## Repository Structure

- `.vimrc` — Main Vim configuration file using vim-plug as the plugin manager

## Key Configuration Areas

### Plugin Manager
- Uses **vim-plug** (`call plug#begin()` / `call plug#end()`)
- Install plugins with `:PlugInstall`, update with `:PlugUpdate`
- The config contains some commented-out Vundle references (legacy, ignore these)

### Installed Plugins
- **vim-shellcheck** — Shell script linting
- **emmet-vim** — HTML/CSS abbreviation expansion
- **rust.vim** — Rust syntax highlighting and utilities
- **jedi-vim** — Python autocompletion and navigation
- **vim-fugitive** — Git integration (run git commands inside Vim)
- **vim-railscasts-theme** — Color scheme (currently using gruvbox)
- **vim-airline** with tabline — Status line and buffer management

### Visual Configuration
- **Colorscheme:** gruvbox (dark background)
- **Line highlighting:** Column 80 (colorcolumn) and cursor line/column enabled
- **Line numbers:** Enabled with custom highlighting
- **Syntax highlighting:** Enabled by default
- **Search highlighting:** Enabled with custom colors

### Editor Behavior
- **Indentation:** 4-space tabs with smart indentation
- **Case sensitivity:** Ignore case (`:set ic`)
- **Text wrapping:** Line break without breaking words (`:set linebreak`)
- **Expandtab:** Spaces instead of tabs

## Common Customization Patterns

### To modify colors/highlighting
Colors are defined with `hi` commands (e.g., `hi Search ctermbg=234 ctermfg=202`). Terminal color codes are numeric:
- Format: `ctermbg=<bg_code>` and `ctermfg=<fg_code>`
- Common codes: 0-15 (basic), 16-231 (256-color palette), 232-255 (grayscale)

### To add a new plugin
```vim
Plug 'username/plugin-name'
```
Then run `:PlugInstall` in Vim.

### To change the colorscheme
Replace `colorscheme gruvbox` with another scheme name, or download and install gruvbox if missing:
```bash
cd ~/.vim/
git clone https://github.com/morhetz/gruvbox.git
```

## Notes

- The file contains both active vim-plug configuration (lines 1-35) and commented-out Vundle references (lines 38-74) — the Vundle section is legacy and can be removed
- Some configuration is duplicated (airline settings appear twice)
- The gruvbox colorscheme must be installed separately for the config to work without error

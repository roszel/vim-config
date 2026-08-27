# Vim Plugins & Hotkeys Guide

Your new Vim configuration includes modern, high-productivity plugins. This guide explains what each plugin does and how to use it.

---

## 🚀 Top Productivity Plugins

### 1. **FZF - Fuzzy Finder** (`junegunn/fzf` + `juneguun/fzf.vim`)

**What it does:** Lightning-fast fuzzy search for files, buffers, and content. The single biggest productivity upgrade for Vim.

**Hotkeys:**
- **`Ctrl+P`** — Search and open files in the current directory
- **`Ctrl+B`** — Switch between open buffers
- **`:Rg [pattern]`** — Search file contents (requires `ripgrep` to be installed)
- **`:History`** — Search command history

**How to use:**
```
Press Ctrl+P
Type part of a filename
Results filter as you type
Press Enter to open the file
Press Escape to cancel
```

**Tips:**
- Type `path/` to narrow search to a folder
- Type `.ext` to find files by extension (e.g., `.py` for Python)
- Type `!` at the start to search for patterns in filenames

---

### 2. **vim-surround** (`tpope/vim-surround`)

**What it does:** Add, change, or delete surrounding characters (quotes, brackets, tags, etc.)

**Hotkeys:**
- **`cs"'`** — Change surrounding `"` to `'` → `"hello"` becomes `'hello'`
- **`ds"`** — Delete surrounding `"` → `"hello"` becomes `hello`
- **`ys2w"`** — Surround next 2 words with `"` → `hello world` becomes `"hello world"`
- **`S"`** — In visual mode, surround selection with `"`

**How to use:**
```
Example: You have "old text"
Press cs"'     → Changes to 'old text'
Press ds'      → Changes to old text
```

**Works with:**
- Quotes: `"`, `'`, `` ` ``
- Brackets: `(`, `[`, `{`
- HTML tags: `t` for tag

---

### 3. **vim-commentary** (`tpope/vim-commentary`)

**What it does:** Quickly toggle comments on/off for any language.

**Hotkeys:**
- **`gcc`** — Toggle comment on current line
- **`gcap`** — Toggle comment on paragraph
- **`gc`** — Toggle comment on selection (in visual mode)

**How to use:**
```
Move cursor to a line of code
Press gcc
Line gets commented/uncommented
```

**Works with:** Python, Rust, Shell, JavaScript, HTML, CSS, etc. (automatically detects language)

---

### 4. **ALE - Async Linting & Fixing** (`dense-analysis/ale`)

**What it does:** Real-time error and warning checking for all your languages. Shows issues as you type without slowing Vim down.

**Visual Feedback:**
- `✘` in sign column = Error
- `⚠` in sign column = Warning
- Hover over a line to see the error message

**Hotkeys:**
- **`:ALEFix`** — Auto-fix issues in the current file (if available)
- **`:ALEInfo`** — Show which linters are active
- **`]a`** — Jump to next error
- **`[a`** — Jump to previous error

**Supported Languages (configured):**
- **Python:** pylint, flake8 (linting) + black, isort (fixing)
- **Rust:** cargo, clippy (linting) + rustfmt (fixing)
- **Shell:** shellcheck
- **HTML:** htmlhint
- **CSS:** stylelint

**How to use:**
```
Open a Python file with a syntax error
ALE immediately highlights it with ✘
Press :ALEFix to auto-fix (if possible)
Or hover over the error to see details
```

---

### 5. **vim-gitgutter** (`airblade/vim-gitgutter`)

**What it does:** Shows which lines you added, modified, or removed in git. Visual indicator of your changes.

**Sign Column Indicators:**
- `+` = Added line
- `~` = Modified line
- `-` = Removed line

**Hotkeys:**
- **`]c`** — Jump to next change
- **`[c`** — Jump to previous change
- **`<Leader>hp`** — Preview the hunk (what changed)
- **`<Leader>hu`** — Undo the hunk (revert changes)
- **`<Leader>hs`** — Stage the hunk (git add)

**How to use:**
```
Open a file in a git repository
Make changes to some lines
gitgutter shows +/~/- in left margin
Press ]c to jump between your changes
```

**Note:** Works great with `:Git` (fugitive) to see full diffs

---

### 6. **vim-closetag** (`alvan/vim-closetag`)

**What it does:** Auto-closes HTML/XML tags as you type. Pairs perfectly with Emmet.

**How it works:**
```
Type: <div>
Auto-closes to: <div></div>
Cursor stays between tags ready to type
```

**Supported filetypes:** HTML, JSX, TSX, XML, Vue

---

### 7. **vim-airline** (`vim-airline/vim-airline` + themes)

**What it does:** Beautiful, informative status line at the bottom showing file info, git branch, errors, etc.

**Shows:**
- Current mode (INSERT, NORMAL, VISUAL)
- File path & name
- File type
- Line/column position
- File encoding
- Git branch (if in a repo)
- ALE error/warning count

**No hotkeys needed** — just displays useful info automatically

---

## 🎨 Other Included Plugins

### **vim-fugitive** (`tpope/vim-fugitive`)
Git integration for Vim. Run git commands without leaving Vim.

**Key commands:**
- **`:Git [command]`** — Run any git command (`:Git log`, `:Git diff`, etc.)
- **`:Gblame`** — Show who changed each line
- **`:Gdiff`** — Show git diff in a split window

---

### **emmet-vim** (`mattn/emmet-vim`)
Fast HTML/CSS abbreviation expansion.

**How to use:**
```
Type: html:5
Press Ctrl+Y,    (Ctrl+Y comma)
Expands to: Full HTML5 boilerplate

Type: ul>li*5
Expands to: <ul><li></li><li></li>...</ul>
```

---

### **rust.vim** (`rust-lang/rust.vim`)
Rust language support (syntax, formatting, etc.)

- Syntax highlighting for `.rs` files
- `:RustFmt` to format code
- Integrates with ALE for clippy linting

---

### **vim-shellcheck** (`itspriddle/vim-shellcheck`)
Shell script linting and validation.

- Checks `.sh` files for errors
- Integrates with ALE for reporting issues

---

## ⌨️ Custom Hotkeys (Defined in Config)

These are extras I added for convenience:

**Window Navigation:**
- **`Ctrl+J`** — Move to split below
- **`Ctrl+K`** — Move to split above
- **`Ctrl+H`** — Move to split left
- **`Ctrl+L`** — Move to split right

**Quick Save:**
- **`Ctrl+S`** — Save current file

---

## 🎯 Workflow Examples

### Example 1: Finding & Editing a File
```
1. Press Ctrl+P
2. Type "test" to find test files
3. Press Enter to open
4. Edit the file
5. Press Ctrl+S to save
6. ALE shows any errors
7. Press ]a to jump to next error
8. Use :ALEFix to auto-fix
```

### Example 2: Commenting Code
```
1. Select multiple lines in visual mode
2. Press gc (or press gcc on individual line)
3. Lines toggle between commented/uncommented
```

### Example 3: Changing HTML Tags
```
1. Position cursor on <div>...</div>
2. Type cs<div><span>
3. Changes to <span>...</span>
```

### Example 4: Reviewing Git Changes
```
1. Press ]c to jump to next changed line
2. Press <Leader>hp to preview the change
3. Press <Leader>hs to stage it
4. Run :Git commit to commit changes
```

---

## 🛠️ Troubleshooting

**FZF not working?**
- Make sure you have the `fzf` CLI tool installed: `brew install fzf` (Mac) or `apt install fzf` (Linux)

**ALE not showing errors?**
- Run `:ALEInfo` to see which linters are enabled
- Install the linter for your language (e.g., `pip install flake8` for Python)

**Colors look wrong?**
- Your terminal should support 256 colors or true color
- Try setting: `:set termguicolors` (already in config)

**Want to disable a plugin?**
- Edit `.vimrc` and comment out the `Plug` line for that plugin
- Run `:PlugClean` to remove it

---

## 📚 Quick Reference Cheatsheet

| Plugin | Hotkey | Action |
|--------|--------|--------|
| FZF | `Ctrl+P` | Find files |
| FZF | `Ctrl+B` | Switch buffers |
| vim-surround | `cs"'` | Change surrounding quotes |
| vim-surround | `ds"` | Delete surrounding quotes |
| vim-commentary | `gcc` | Toggle comment |
| ALE | `:ALEFix` | Auto-fix issues |
| ALE | `]a` | Jump to next error |
| gitgutter | `]c` | Jump to next change |
| gitgutter | `[c` | Jump to previous change |
| Fugitive | `:Gblame` | Show git blame |
| Emmet | `Ctrl+Y,` | Expand abbreviation |

---

## 🎓 Next Steps

1. **Practice FZF:** Spend a day using Ctrl+P instead of `:e` to open files — it's a game-changer
2. **Learn vim-surround:** Try `cs`, `ds`, `ys` on different text to get muscle memory
3. **Use ALE:** Rely on it for linting; run `:ALEFix` before committing
4. **Git integration:** Use gitgutter to review changes before staging

---

**Questions?** Check `:help [plugin-name]` inside Vim or read the exported chat for more context.

Happy Vimming! 🚀

" ============================================================================
" VIM CONFIGURATION - Modern clean setup with vim-plug
" ============================================================================

" ============================================================================
" PLUGIN MANAGER: vim-plug
" ============================================================================
call plug#begin()

" Navigation & searching
Plug 'junegunn/fzf'                     " Fuzzy finder (install separately: brew install fzf)
Plug 'junegunn/fzf.vim'                 " fzf integration for Vim

" Git integration
Plug 'tpope/vim-fugitive'               " Git commands inside Vim (:Git, :Gblame, etc)
Plug 'airblade/vim-gitgutter'           " Shows +/- in sign column for git changes

" Text editing enhancements
Plug 'tpope/vim-surround'               " Add/change/delete surrounding quotes/tags (cs"', ds', etc)
Plug 'tpope/vim-commentary'             " Toggle comments (gcc, gcap, etc)

" HTML/CSS
Plug 'mattn/emmet-vim'                  " Fast HTML/CSS abbreviation expansion
Plug 'alvan/vim-closetag'               " Auto-close HTML tags

" Rust
Plug 'rust-lang/rust.vim'               " Rust syntax, formatting, etc

" Shell
Plug 'itspriddle/vim-shellcheck'        " ShellCheck integration

" Linting & fixing (async, works across all languages)
Plug 'dense-analysis/ale'               " Async linting & fixing engine
" NOTE: Alternative if you need full autocomplete/hover/go-to-def: Plug 'neoclide/coc.nvim'

" Statusline & tabline
Plug 'vim-airline/vim-airline'          " Status & tab line
Plug 'vim-airline/vim-airline-themes'   " Airline themes

" Colorscheme
Plug 'morhetz/gruvbox'                  " Gruvbox color scheme
" NOTE: Modern alternative: Plug 'sainnhe/gruvbox-material'

call plug#end()

" ============================================================================
" GENERAL OPTIONS
" ============================================================================
set nocompatible                        " Be improved
filetype plugin indent on               " Enable filetype-based indentation & plugins
syntax on                               " Enable syntax highlighting

" Search
set ignorecase                          " Ignore case in searches
set hlsearch                            " Highlight search results
set incsearch                           " Incremental search

" Indentation
set smartindent                         " Smart auto-indenting
set expandtab                           " Use spaces instead of tabs
set tabstop=4                           " 4 spaces per tab
set shiftwidth=4                        " 4 spaces per indent level

" Display
set number                              " Line numbers
set linebreak                           " Wrap lines at word boundaries, not mid-word
set splitbelow                          " New split windows go below
set splitright                          " New split windows go right

" Behavior
set backspace=indent,eol,start          " Allow backspace in insert mode
set mouse=a                             " Enable mouse in all modes (optional, comment out if unwanted)

" ============================================================================
" APPEARANCE
" ============================================================================
colorscheme gruvbox
set background=dark

" True color support for better rendering on modern terminals
if has('termguicolors')
    set termguicolors
endif

" Column & line highlighting
set colorcolumn=80                      " Show column at position 80
highlight ColorColumn ctermbg=234

set cursorline                          " Highlight current line
set cursorcolumn                        " Highlight current column
highlight CursorLineNr ctermbg=24
highlight CursorColumn ctermbg=16 ctermfg=29

" Search highlight customization
highlight Search ctermbg=234 ctermfg=202

" Number column customization
highlight Number ctermbg=24 ctermfg=250

" ============================================================================
" PLUGIN CONFIGURATION
" ============================================================================

" --- vim-airline ---
let g:airline#extensions#tabline#enabled = 1       " Show all buffers when single tab
let g:airline#extensions#tabline#left_alt_sep = '|'
set term=xterm-256color

" --- ALE (Async Linting Engine) ---
let g:ale_linters = {
    \ 'python': ['pylint', 'flake8'],
    \ 'rust': ['cargo', 'clippy'],
    \ 'shell': ['shellcheck'],
    \ 'html': ['htmlhint'],
    \ 'css': ['stylelint'],
    \ }
let g:ale_fixers = {
    \ 'python': ['black', 'isort'],
    \ 'rust': ['rustfmt'],
    \ 'html': ['prettier'],
    \ }
let g:ale_fix_on_save = 0               " Manual fixes with :ALEFix (change to 1 for auto-fix on save)
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" --- fzf.vim ---
" :Files       - Find files
" :Buffers     - Find open buffers
" :Rg          - Search content (requires ripgrep; fallback to :grep)
" :History     - Search command history
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>

" --- vim-fugitive ---
" :Git         - Run git commands
" :Gblame      - Show git blame for current file
" :Gdiff       - Show git diff in split
" [c / ]c      - Navigate to next/prev hunk (with vim-gitgutter)

" --- vim-gitgutter ---
" Shows + / - / ~ in sign column for added/removed/modified lines
" ]c / [c      - Jump to next/prev hunk
" <Leader>hp   - Preview hunk
" <Leader>hu   - Undo hunk

" --- vim-surround ---
" cs"'         - Change surrounding " to '
" ds"          - Delete surrounding "
" ys2w"        - Surround next 2 words with "
" S"           - Add surrounding in visual mode

" --- vim-commentary ---
" gcc          - Toggle comment on current line
" gcap         - Toggle comment on current paragraph
" gc           - In visual mode, toggle comment

" --- vim-closetag ---
" Auto-closes HTML tags; configure filetypes:
let g:closetag_filenames = '*.html,*.jsx,*.tsx,*.xml,*.vue'

" --- emmet-vim ---
" <C-y>,       - Expand abbreviation (default is <C-y>, - check with :imap <C-y>)
" Examples: html:5 -> expands to HTML5 boilerplate
"           ul>li*5 -> <ul><li></li>...</ul>

" ============================================================================
" KEYBINDINGS (Optional - add your custom mappings here)
" ============================================================================

" Navigate splits with Ctrl+hjkl
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Quick save
nnoremap <C-s> :w<CR>

" ============================================================================
" LANGUAGE-SPECIFIC SETTINGS
" ============================================================================

" Python
autocmd FileType python setlocal textwidth=88

" Rust
let g:rustfmt_autosave = 1

" HTML/CSS
autocmd FileType html,css setlocal shiftwidth=2 tabstop=2

" ============================================================================
" END OF CONFIGURATION
" ============================================================================

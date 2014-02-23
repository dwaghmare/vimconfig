" Leader keys
:let mapleader = "-"
:let maplocalleader = "\\"

" Workarounds in absence of Drupal .vimrc working
" See https://drupal.org/node/2195775
:au BufNewFile,BufRead *.install,*.test,*.inc,*.module set filetype=php
:au BufNewFile,BufRead *.info set filetype=drini

" Integration with own Drupal vim repository
:let g:drupal_vim_dir = "~/.vimrc.d/drupal_vim"
" Only load Drupal vim on command
noremap <buffer> <leader><F2>d<CR> :source ~/.vimrc.d/drupal_vim/.drupal.vimrc<CR>

" UTF-8 by default
set encoding=utf-8
" Unix line endings by default
let PHP_removeCRwhenUnix = 1

" General settings
set incsearch               "Find as you type
set scrolloff=2             "Number of lines to keep above/below cursor
set number                  "Show line numbers
set wildmode=longest,list   "Complete longest string, then list alternatives
set pastetoggle=<F2>        "Toggle paste mode
set fileformats=unix        "Use Unix line endings
set history=300             "Number of commands to remember
set showmode                "Show whether in Visual, Replace, or Insert Mode
set showmatch               "Show matching brackets/parentheses
set backspace=2             "Use standard backspace behavior
set hlsearch                "Highlight matches in search
set ruler                   "Show line and column number
set formatoptions=1         "Don't wrap text after a one-letter word
set linebreak               "Break lines when appropriate

" Enable syntax highlighting
if &t_Co > 1
  syntax enable
endif
syntax on

" Leader keys
let mapleader = "-"
let maplocalleader = "\\"

" (e)dit my (v)imrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>epv :vsplit ~/.vimrc.d/personal/.vimrc<cr>
" (s)ource my (v)imrc
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>spv :source ~/.vimrc.d/personal/.vimrc<cr>

" Save more wear on your left hand than any other mapping you ever create
inoremap jk <esc>
" Unmap the escape key!
inoremap <esc> <nop>

" Coder run on Drupal files
function! CoderVerify()
  " Check for Drupal vimrc Vundle: safest way to test if it's a Drupal file.
  if exists("drupaldetect#DrupalRoot")
    let is_drupal = (&filetype == 'php.drupal')
  "  Otherwise, if Vundle isn't present, check file suffix.
  else
    let is_drupal = (index(['module', 'install', 'test', 'inc'], expand('%:e%')) >= 0)
  endif

  if !is_drupal
    return
  endif

  let current_file = shellescape(expand('%:p'))
  let filename = shellescape(expand('%:r'))
  let command = "!~/.vimrc.d/personal/coder_review.sh " . current_file
  execute command
endfunction

" Autocommand group prevents repeat registration of au
augroup drupal_files
	autocmd!
  " Workarounds removed as bug closed: https://www.drupal.org/node/2195775
  " Consider all files, but check for file suffix within CoderVerify() if
  " Vundle isn't present to set our Drupal filetype for us.
  au BufWritePost,FileWritePost * call CoderVerify()
augroup END

" Integration with own Drupal vim repository
let g:drupal_vim_dir = "~/.vimrc.d/drupal_vim"

" Only load Drupal/Symfony vim on command
noremap <leader><F2>d<CR> :source ~/.vimrc.d/drupal_vim/.drupal.vimrc<CR>
noremap <leader><F2>s<CR> :source ~/.vimrc.d/symfony_vim/.symfony.vimrc<CR>

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

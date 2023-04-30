if !&compatible
  set nocompatible
endif

let mapleader = "\<Space>"

"dein
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_file = $XDG_CONFIG_HOME.'/nvim/dein.toml'
let g:dein#cache_directory = s:cache_home . '/dein'
let &runtimepath = s:dein_repo_dir .",". &runtimepath
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <C-]> g<C-]>
if has('nvim')
    tnoremap <silent> <ESC> <C-\><C-n>
endif

" autocmd InsertLeave * set nopaste
augroup ResetHighlightSettings
    autocmd!
    autocmd ColorScheme * hi CursorLine cterm=underline gui=underline ctermfg=none ctermbg=none guifg=none guibg=none
                      \ | hi MatchParen ctermfg=green ctermbg=lightgray guifg=green guibg=lightgray
                      \ | hi NonText    ctermbg=none ctermfg=59 guibg=none guifg=none
                      \ | hi SpecialKey ctermbg=none ctermfg=59 guibg=none guifg=none
                      \ | hi SpellBad guifg=gray
                      \ | hi Error guibg=orange
augroup END
syntax enable

set ambiwidth=double
set autoindent
set backspace=eol,indent,start
set clipboard+=unnamed
set clipboard+=unnamedplus
set cursorline
set expandtab
set hlsearch
set inccommand=split
set list
set listchars=tab:¦_,eol:↲,extends:»,precedes:«,nbsp:%
set number
set ruler
set shiftwidth=4
set showmatch
set smartindent
set tabstop=4
set termguicolors
set textwidth=0
if has('persistent_undo')
    set undodir=./.vimundo,$HOME/.vimundo
    set undofile
    set undolevels=1000
endif
set virtualedit=block
set wrapscan
set wildmenu
set wildmode=list:full
" set showtabline=2

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.ts setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

let mapleader = "\<Space>"
autocmd InsertLeave * set nopaste
" dein settings
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'

" XDG base direcory compartible
let g:dein#cache_directory = s:cache_home . '/dein'

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
" let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
"
let s:toml_file = $HOME . '/repo/dotfiles/vim/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" Visual----------
"set background=dark
syntax enable
set number
set ruler
set textwidth=0
set hlsearch
set list
set listchars=tab:¦_,eol:↲,extends:»,precedes:«,nbsp:%
" FIXME 本来はここではなくdein.toml側に入れるべき
" set background をこの後に実行するとリセットされてしまうので、それより後で実行すること
hi NonText    ctermbg=None ctermfg=59 guibg=NONE guifg=None
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE guifg=None
set ambiwidth=double
set showtabline=2

" Input---------
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set showmatch
set backspace=eol,indent,start
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
"----------

" Behavior----------
set wrapscan
set clipboard+=unnamed
set clipboard+=unnamedplus
set wildmenu
set wildmode=list:full
set virtualedit=block
filetype plugin indent on
set inccommand=split
"---------

" Specify
""Markdown----------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"----------

" Python----------
let g:python_highlight_all = 1
"----------

" highlight----------
hi DiffAdd    ctermfg=white ctermbg=196
hi DiffChange ctermfg=white ctermbg=240
hi DiffDelete ctermfg=white ctermbg=240
set cursorline
"----------

" Key Binding---------
if has('nvim')
    tnoremap <silent> <ESC> <C-\><C-n>
endif
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <C-]> g<C-]>
"--------------------

set virtualedit=block
if has('persistent_undo')
    set undodir=./.vimundo,$HOME/.vimundo
    set undofile
    set undolevels=1000
endif

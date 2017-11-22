if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
" let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
"
let s:toml_file = $HOME . '/git/dotfiles/vim/dein.toml'
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

" NeoVim----------
if has('nvim')
    tnoremap <silent> <ESC> <C-\><C-n>
endif

" Visual----------
set background=dark
syntax enable
set number
set ruler
set textwidth=0
set hlsearch
set list
set listchars=tab:¦_,eol:↲,extends:»,precedes:«,nbsp:%
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
"----------

" Behavior----------
set wrapscan
set clipboard=unnamed
set wildmenu
set wildmode=list:full
set virtualedit=block
filetype plugin indent on
"---------

" Key Binding---------
nnoremap <silent><esc><esc> :nohlsearch<CR>
imap <C-j> <esc>
"--------------------

" Specify
""Markdown----------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"----------

" Python----------
let g:python_highlight_all = 1
"----------

" diff----------
hi DiffAdd    ctermfg=white ctermbg=196
hi DiffChange ctermfg=white ctermbg=240
hi DiffDelete ctermfg=white ctermbg=240
"----------


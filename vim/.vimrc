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
"/Users/yusuke/git/dotfiles/vim
let s:toml_file = $HOME . '/git/dotfiles/vim/dein.toml'
" let s:toml_file = '/Users/yusuke/git/dotfiles/vim/dein.toml'
" let s:toml_file = $XDG_CONFIG_HOME . '/nvim/dein.toml'
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

"dein Scripts-----------------------------
" " Required:
" let s:dein_path = expand('~/.vim/pack/lakuen/start/dein.vim/extension')
" set runtimepath+=~/.vim/pack/lakuen/start/dein.vim
" 
" if dein#load_state(s:dein_path)
"     call dein#begin(s:dein_path)
"     call dein#add('Shougo/dein.vim')
" 
"     " Add or remove your plugins here:
"     call dein#add('Shougo/neosnippet.vim')
"     call dein#add('Shougo/neosnippet-snippets')
"     call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
" 
"     " NeoVim専用
"     if has('nvim') || has('vi')
"         call dein#add('Shougo/deoplete.nvim')
"         call dein#add('zchee/deoplete-jedi')
" 
"     endif
"     " TABでの補完
"     inoremap <silent><expr> <TAB>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<TAB>" :
"     \ deoplete#mappings#manual_complete()
"     function! s:check_back_space() abort "{{{
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
"     endfunction"}}}
" 
"     call dein#add('Vimjas/vim-python-pep8-indent')
"     call dein#add('majutsushi/tagbar')
" 
"     call dein#end()
"     call dein#save_state()
" 
"     if dein#check_install()
"         call dein#install()
"     endif
" endif
" 
" let g:dein#enable_notification = 1
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 0
" let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#enable_refresh_always = 0
" 
" " Required:
" syntax enable
" "End dein Scripts-------------------------

" Visual----------
set background=dark
colorscheme railscasts
set number
set ruler
set textwidth=0
set hlsearch
set list
set listchars=tab:¦_,eol:↲,extends:»,precedes:«,nbsp:%
set ambiwidth=double

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
" nnoremap <silent> <C-p> :PrevimOpen<CR>
"----------

" Python----------
let g:python_highlight_all = 1
"----------

" PlantUML----------
" let g:plantuml_executable_script = "~/.plantuml"
"----------

" diff----------
hi DiffAdd    ctermfg=white ctermbg=196
hi DiffChange ctermfg=white ctermbg=240
hi DiffDelete ctermfg=white ctermbg=240
"----------

" ALE----------
" let g:ale_linters = {
" \   'python': ['flake8'],
" \}
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = "!!"
" let g:ale_sign_warning = ">>"
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
"----------

"lightline----------
" 下部の表示領域のサイズの調整？
set laststatus=2
set runtimepath+=~/.vim/pack/LAKuEN/start/lightline.vim/

" lightline.vimの設定
" let g:lightline = {
" \   'component_expand': {
" \     'ale': 'ALEGetStatusLine',
" \   },
" \   'component_type': {
" \     'syntaxcheck': 'error',
" \   },
" \   'colorscheme': 'powerline',
" \   'mode_map': {'c': 'NORMAL'},
" \   'active': {
" \     'left': [
" \       ['mode', 'paste'],
" \       ['readonly', 'filename', 'modified', 'ale'],
" \     ],
" \     'right': [
" \       ['syntaxcheck'],
" \     ]
" \   },
" \}
" let g:lightline = {
" \ 'colorscheme': 'powerline',
" \}
" let g:lightline = {
" \   'active': {
" \     'left': [
" \       ['mode', 'paste'],
" \       ['readonly', 'filename', 'modified'],
" \       ['ale'],
" \     ]
" \   },
" \   'component_function': {
" \     'ale': 'ALEStatus'
" \   }
" \}

" function! ALEStatus()
"   return ALEGetStatusLine()
" endfunction
"----------"


"NERDTree----------
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map <C-n> :NERDTreeToggle<CR>
"NERDTree----------

" let g:dein#enable_notification = 1
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 0
" let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#enable_refresh_always = 0
syntax enable

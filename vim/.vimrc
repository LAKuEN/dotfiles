" Visual----------
set background=dark
"colorscheme greenvision
"colorscheme molokai
"colorscheme solarized
"colorscheme hybrid
colorscheme railscasts
" syntax on
set number
set ruler "現在カーソルが表示されている行・文字番号を画面右下に表示
set textwidth=0 "文字列の折り返しを無効
set hlsearch "検索条件に合致した箇所をハイライト
set list
"タブ文字の表示
set listchars=tab:¦_,eol:↲,extends:»,precedes:«,nbsp:%
"全角記号の幅
set ambiwidth=double
" 行列ハイライト: 重い！！！
" set cursorline cursorcolumn
" 現在行強調
" highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

" Input---------
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set showmatch "閉じ括弧を入力した際に開き括弧を示す
set backspace=eol,indent,start "改行文字、既存の文字列、オートインデントで入力されたインデントの削除を可能に
"----------

" Behavior----------
set wrapscan "ファイル末尾まで検索したら最初に戻る
set clipboard=unnamed "クリップボードを共有
set wildmenu "入力補完の候補をコマンドライン上部に表示
set wildmode=list:full "入力補完時に候補を全て表示しつつ、TABを押す度に次の候補に移る
set virtualedit=block "ビジュアルモードでの矩形選択時に文字の無いところまで選択範囲を広げられる
filetype plugin indent on "ファイルタイプ別のプラグインのロード、インデントのロードを有効に
"---------

" Key Binding---------
nnoremap <silent><esc><esc> :nohlsearch<CR>
"inoremap <silent><esc><esc> :set iminsert=0<CR> 
imap <C-j> <esc>
"--------------------


" Specify
""Markdown----------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
nnoremap <silent> <C-p> :PrevimOpen<CR>
"----------

" Python----------
let g:python_highlight_all = 1
"----------

" PlantUML----------
let g:plantuml_executable_script = "~/.plantuml"
"----------

" diff----------
hi DiffAdd    ctermfg=white ctermbg=196
hi DiffChange ctermfg=white ctermbg=240
hi DiffDelete ctermfg=white ctermbg=240
"----------

" ALE----------
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_sign_column_always = 1
let g:ale_sign_error = "!!"
let g:ale_sign_warning = ">>"
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
highlight clear ALEErrorSign
highlight clear ALEWarningSign
"----------

"lightline----------
" 下部の表示領域のサイズの調整？
set laststatus=2
set runtimepath+=~/.vim/pack/LAKuEN/start/lightline.vim/

" lightline.vimの設定
let g:lightline = {
\   'component_expand': {
\     'ale': 'ALEGetStatusLine',
\   },
\   'component_type': {
\     'syntaxcheck': 'error',
\   },
\   'colorscheme': 'powerline',
\   'mode_map': {'c': 'NORMAL'},
\   'active': {
\     'left': [
\       ['mode', 'paste'],
\       ['readonly', 'filename', 'modified', 'ale'],
\     ],
\     'right': [
\       ['syntaxcheck'],
\     ]
\   },
\}
let g:lightline = {
\ 'colorscheme': 'powerline',
\}
let g:lightline = {
\   'active': {
\     'left': [
\       ['mode', 'paste'],
\       ['readonly', 'filename', 'modified'],
\       ['ale'],
\     ]
\   },
\   'component_function': {
\     'ale': 'ALEStatus'
\   }
\}

function! ALEStatus()
  return ALEGetStatusLine()
endfunction
"----------"

"dein Scripts-----------------------------
" Required:
let s:dein_path = expand('~/.vim/pack/lakuen/start/dein.vim/extension')
set runtimepath+=~/.vim/pack/lakuen/start/dein.vim

if dein#load_state(s:dein_path)
    call dein#begin(s:dein_path)
    call dein#add('Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    " NeoVim専用
    if has('nvim') || has('vi')
        call dein#add('Shougo/deoplete.nvim')
        call dein#add('zchee/deoplete-jedi')

    endif
    " TABでの補完
    inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
    function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
    endfunction"}}}

    call dein#add('Vimjas/vim-python-pep8-indent')
    call dein#add('majutsushi/tagbar')

    call dein#end()
    call dein#save_state()

    if dein#check_install()
        call dein#install()
    endif
endif

let g:dein#enable_notification = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_refresh_always = 0

" Required:
syntax enable
"End dein Scripts-------------------------

"NERDTree----------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
"NERDTree----------

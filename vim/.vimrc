" Visual----------
colorscheme greenvision
syntax on
set number
set ruler "現在カーソルが表示されている行・文字番号を画面右下に表示
set textwidth=0 "文字列の折り返しを無効
set hlsearch "検索条件に合致した箇所をハイライト
set list
"タブ文字の表示
set listchars=tab:¦_,eol:↲,extends:»,precedes:«,nbsp:%
" 行列ハイライト
set cursorline cursorcolumn
set ambiwidth=double  "全角記号の幅
" 現在行強調
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

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
" :WatchdogsRun後にlightline.vimを更新
let g:Qfstatusline#UpdateCmd = function('lightline#update')

" lightline.vimの設定
let g:lightline = {
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
\   'component_expand': {
\     'ale': 'ALEGetStatusLine',
\     'syntaxcheck': 'qfstatusline#Update',
\   },
\   'component_type': {
\     'syntaxcheck': 'error',
\   },
\}
let g:lightline = {
\ 'colorscheme': 'powerline',
\}
"----------"

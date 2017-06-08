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
"let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
"let g:indent_guides_start_level=2
" 自動カラーを無効にする
"let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
"let g:indent_guides_color_change_percent = 30
" ガイドの幅
"let g:indent_guides_guide_size = 1
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


""watchdogs----------
" watchdogs#setup()を参照できるように、パスに追加する
"set runtimepath+=~/.vim/pack/LAKuEN/start/vim-watchdogs/
"let g:quickrun_config = {
"\   "_": { "\       "runner": "vimproc",
"\       "runner/vimproc/updatetime": 10,
"\   },
"\   "watchdogs_checker/_": {
"\       "outputter/quickfix/open_cmd": "",
"\       "hook/qfstatusline_update/enable_exit": 1,
"\       "hook/qfstatusline_update/priority_exit": 4,
"\   },
"\   "python/watchdogs_checker": {
"\       "type": "watchdogs_checker/flake8",
"\   },
"\   "watchdogs_checker/flake8": {
"\       "command": "flake8",
"\   },
"\}
""\       "runner/vimproc/updatetime": 10,
""\   "watchdogs_checker/pyflakes": {
""\       "command": "pyflakes",
""\   },
"" syntax check
"" 書き込み後
"let g:watchdogs_check_BufWritePost_enable = 1
"" 一定時間キー入力がなかった時: バッファへの書き込み後、1度だけ実行される
"let g:watchdogs_check_CursorHold_enable = 1
"
"" watchdogs.vim の設定を追加
"call watchdogs#setup(g:quickrun_config)
"
"" テキスト変更時にチェックが走るように設定
"" 対象ファイルの拡張子を指定する
"augroup my_watchdogs
"  autocmd!
"  autocmd BufWritePost,TextChanged *.py WatchdogsRun
"  autocmd BufRead,BufNewFile *.py WatchdogsRun
""  autocmd BufRead,BufNewFile *.py
""      \   xnoremap <buffer><silent> x x:WatchdogsRun<CR><left>
""      \ | xnoremap <buffer><silent> d d:WatchdogsRun<CR><left>
""      \ | xnoremap <buffer><silent> D D:WatchdogsRun<CR><left>
""      \ | nnoremap <buffer><silent> D D:WatchdogsRun<CR><left>
""      \ | nnoremap <buffer><silent> dd dd:WatchdogsRun<CR><left>
""      \ | nnoremap <buffer><silent> dw dw:WatchdogsRun<CR><left>
""      \ | nnoremap <buffer><silent> u u:WatchdogsRun<CR><left>
""      \ | nnoremap <buffer><silent> <C-R> <C-R>:WatchdogsRun<CR><left>
""      \ | inoremap <buffer><silent> <Esc> <Esc>:WatchdogsRun<CR><left>
"augroup END
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

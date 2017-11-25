"ファイル読み込み時の文字コードを指定
set enc=utf-8
"文字コードをutf-8に設定
set fenc=utf-8
"□や○文字が崩れる問題を解決
set ambiwidth=double
"バックアップファイルを作らない
set nobackup
"スワップファイルを作らない
set noswapfile
"編集中のファイルが変更されたら自動で読み直す
set autoread
"バッファが編集中でも他のファイルが開ける
set hidden
"入力中のコマンドをステータスに表示する
set showcmd
"シンタックスハイライトをON
syntax enable
"きれいにコピペができる
"set paste

"tabを>-、半角スペースを.で表示する
""set list
""set listchars=tab:>-,trail:.

"行番号を表示
set number
"行にアンダーラインを表示
set cursorline
"行末の一つ先までカーソル移動できるようにする
set virtualedit=onemore
"ステータスラインを表示
set laststatus=2
"括弧入力時に対応する括弧を表示
set showmatch
"コマンドラインの補完
set wildmenu wildmode=list:longest,full
"ビープ音を無効
set visualbell t_vb=
"エラーメッセージの表示時にビープ音を鳴らさない
set noerrorbells
"上下8行の視界を確保
set scrolloff=8
"左右スクロール時のの視界を確保
set sidescrolloff=16


inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap ` ``<ESC>i
inoremap [ []<ESC>i
"ハイライトを削除
nmap <ESC><ESC> :nohlsearch<CR><ESC>
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
inoremap {<ENTER> {}<LEFT><CR><ESC><S-o>
"inoremap (<ENTER> ()<LEFT><CR><ESC><S-o>
set backspace=indent,eol,start

"tab系
"行頭TAB文字の表示幅
set tabstop=4
"連続した空白に対してタブキーやバックスペースでカーソルが移動する幅
set softtabstop=4
"自動インデントでずれる幅
set shiftwidth=4
"TAB文字を半角スペースにする
set expandtab
""自動的にインデントする
set cindent

"検索系
"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"検索文字入力時に順次対象文字列にヒットさせる
set incsearch
"検索時に最後まで行ったら最初に戻る
set wrapscan
"検索語をハイライト表示
set hlsearch
"カーソルが行の端で止まらない


"マウス操作を設定
"set mouse=a
"ヤンクをクリップボードに保存
set clipboard+=unnamed


set whichwrap=b,s,h,l,<,>,[,]
"ファイルのパスをタイトルに表示
set title
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

""set background=dark
"colorscheme desert
""
""let g:indent_guides_enable_on_vim_startup = 1

"ペースト設定"
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"マウスの有効化
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif


"------------NeoBundleインストール--------------

filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

"------ここにプラグインを追加------
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'
"ディレクトリをツリー表示
NeoBundle 'scrooloose/nerdtree'
"end補完
NeoBundle 'tpope/vim-endwise'
"複数行コメント
NeoBundle 'tomtom/tcomment_vim'
"ステータスラインを強化
NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'vim-airline/vim-airline'
"NeoBundle 'vim-airline/vim-airline-themes'

"全角半角空白を表示
NeoBundle 'bronson/vim-trailing-whitespace'
"インデントの可視化
NeoBundle 'Yggdroot/indentLine'

"カラースキーマ
NeoBundle 'jacoborus/tender.vim'
NeoBundle 'tomasr/molokai'


"----------------------------------

call neobundle#end()

filetype plugin indent on

"カラースキーマを設定
colorscheme molokai
set t_Co=256


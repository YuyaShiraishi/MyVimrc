" ===================================================================
" dein vim install
" ===================================================================
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" ===================================================================
" dein vim config
" ===================================================================
if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin('$HOME/.cache/dein')
call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

call dein#load_toml('$HOME/.vim/dein.toml')

call dein#end()
call dein#save_state()

filetype indent plugin on
syntax enable

if dein#check_install()
  call dein#install()
endif

" ===================================================================
" NERD Tree config
" ===================================================================
" F3キーで表示/非表示の切り替え
nnoremap <F3> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" 余分なものを表示させない
let g:NERDTreeMinimalUI=1
" 隠しファイルの表示
let g:NERDTreeShowHidden = 1
" 右側に表示
let g:NERDTreeWinPos='right'

" カスタムキー設定
" なるべくhjklで完結させたい
let g:NERDTreeMapActivateNode='l'
let g:NERDTreeMapUpdirKeepOpen='h'


" ===================================================================
" ale config
" ===================================================================
let g:ale_linters = {
  \  'javascript': ['eslint'],
  \  'python': ['flake8'],
  \  'markdown': ['textlint'],
  \}
let g:ale_virtualtext_cursor = 'disabled'


" ===================================================================
" others
" ===================================================================

set encoding=UTF-8
colorscheme Tomorrow-Night

" Tabをスペース2行に
set expandtab
set tabstop=2
set shiftwidth=2

" 行番号
set number

" カーソルラインの表示
set cursorline

" クリップボード連携
set clipboard+=unnamed

" status表示
set laststatus=2

" コマンドモードのTabサジェスト
set wildmenu

" ファイルを閉じた後に再度開いてもundoできる
if has('persistent_undo')
  let undo_path = expand('~/.vim/undo')
  exe 'set undodir=' .. undo_path
  set undofile
endif


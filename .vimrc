" dein vim
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
nnoremap <F3> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos='right'
let g:NERDTreeHighlightCursorline=1
let g:NERDTreeWinSize=25

" ale
" ===================================================================
let g:ale_linters = {
  \  'javascript': ['eslint'],
  \  'python': ['flake8'],
  \  'markdown': ['textlint'],
  \}
let g:ale_virtualtext_cursor = 'disabled'
" ===================================================================

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


let $LANG = 'en_US'

"plugin installer https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'valloric/youcompleteme'
"Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'rking/ag.vim'

"my plugins
Plug 'posva/vim-vue'
"color schemes
Plug 'morhetz/gruvbox'
"Plug 'zenbro/mirror.vim'
"type PlugInstall after
"Plug 'scrooloose/nerdcommenter'
Plug 'skwp/greplace.vim'
"Plug 'tpope/vim-vinegar'
"Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'

Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'jwalton512/vim-blade'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
" Plug 'roxma/nvim-completion-manager'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'godlygeek/tabular'
"Plug 'junegunn/fzf'
"Plug '/usr/local/opt/fzf'
Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'henrik/vim-indexed-search'
"Plug 'google/vim-searchindex'
Plug 'Shougo/deoplete.nvim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-startify'
Plug 'StanAngeloff/php.vim'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'tobyS/pdv'
Plug 'thaerkh/vim-workspace'
call plug#end()

"set rtp+=/usr/local/opt/fzf

"au BufWritePost *.js,*.php,*.vue silent! !ctags 2> /dev/null &

let NERDTreeShowHidden=1

"set nocompatible    " disable backward compatibility with Vi
"filetype plugin on  " plugins are enabled

"altercation/vim-colors-solarized
"syntax enable
"set background=dark
"colorscheme solarized

syntax on
filetype on
au BufNewFile,BufRead *.overrides set filetype=less
au BufNewFile,BufRead *.variables set filetype=less

let g:mapleader=' '
colorscheme gruvbox
set background=dark
set number
set shiftwidth=4
set autoindent
set smartindent

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

set hlsearch
set incsearch
"my settings
set clipboard=unnamed
set linebreak
let g:user_emmet_leader_key='<tab>'

"mappings
:imap qq <Esc>
:vmap qq <Esc>
map <C-n> :NERDTreeToggle<CR>

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" Ctrl+b - leader key for tmux
" ^b+% - vertical
" ^b+" - horizontal

" set clipboard+=unnamedplus 
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

set backspace=indent,eol,start

set splitbelow
set splitright

noremap <leader>/ :Commentary<cr>

"nerdtree settings
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeShowIgnoredStatus = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"tabs toggle
map ˙ :tabp<CR>
map ¬ :tabn<CR>

map ∑ :tabclose<CR>

"set splitright
set wildmenu

tab sball
"set switchbuf=usetab,newtab
set switchbuf=usetab

set exrc
set secure

"NERDCommenter
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code
" indentation
" let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a
" region)
" let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
"
" " Enable NERDCommenterToggle to check all selected lines is commented or not 
" let g:NERDToggleCheckAllLines = 1

" Multiple cursors
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-c>'
let g:multi_cursor_select_all_word_key = '<A-c>'
let g:multi_cursor_start_key           = 'g<C-c>'
let g:multi_cursor_select_all_key      = 'g<A-c>'
let g:multi_cursor_next_key            = '<C-c>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Strange and doubtful
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

let g:ackprg = 'ag --nogroup --nocolor --column'

set viminfo='100,n$HOME/.vim/files/info/viminfo

"let g:vim_prj#opt = {'author': 'Vim_*', 'license': 'GNU GPL 3'}
let g:vim_prj#opt = {'author': 'Vim_*', 'license': 'MIT'}

" thaerkh/vim-workspace
nnoremap <leader>e :ToggleWorkspace<CR>
let g:workspace_session_name = 'session.vim'
let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
let g:workspace_undodir='.undodir'



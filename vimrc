set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"callvundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" color scheme
Plugin 'jpo/vim-railscasts-theme'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" FileSystem Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'    "nerdtree enhancement
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-rails'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'easymotion/vim-easymotion'
" Plugin 'stefanoverna/vim-i18n'

" Editor
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-repeat'
Plugin 'tmhedberg/matchit'
Plugin 'junegunn/vim-easy-align'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'MarcWeber/vim-addon-mw-utils'    " vim-snipmate dependency
Plugin 'tomtom/tlib_vim'                 " vim-snipmate dependency
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Language Plugin
Plugin 'pangloss/vim-javascript'
Plugin 'isRuslan/vim-es6'
Plugin 'mxw/vim-jsx'

" for ESlint rubocop
Plugin 'vim-syntastic/syntastic'

"Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"To ignore plugin indent changes, instead use:
"filetypeplugin on
"
"Brief help
":PluginList       - lists configured plugins
":PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
":PluginSearch foo - searches for foo; append `!` to refresh local cache
":PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"see :h vundle for more details or wiki for FAQ
"Put your non-Plugin stuff after this line

syntax on

set t_Co=256
set ttyfast
set lazyredraw
colorscheme railscasts

set guifont=Literation_Mono_Powerline:h14
set shell=/bin/sh
set clipboard+=unnamed " sync system clipboard
set number
set autoread
set backspace=2
set ruler
set wrap
set linebreak
set cursorline
set hidden
set scrolloff=15
set nobackup

set hlsearch
set incsearch
set ignorecase
set smartcase

set showmatch
set matchtime=1

filetype on
filetype indent on
filetype plugin on

set encoding=utf-8

"tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set shiftround
set list
set listchars=tab:\|\ ,

set diffopt+=vertical

"key map
let mapleader="\<Space>"
" nmap <tab> V>
" nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv
imap <c-k> <Up>
imap <c-j> <Down>

" next/prev quicklist item
nmap <c-b> :cprevious<CR>
nmap <c-n> :cnext<CR>
nmap K i<CR><ESC>
set pastetoggle=<F12>

map q: :q











" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

" automatically load the .vimrc file whenever you save it.
au BufWritePost .vimrc so $MYVIMRC




" 'nathanaelkane/vim-indent-guides'



" ================ Plugin Settings ====================
" === Plugin 'jpo/vim-railscasts-theme'
" === Plugin 'bling/vim-airline'
" === Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='base16'

" === Plugin 'scrooloose/nerdtree'
" === Plugin 'jistr/vim-nerdtree-tabs'    "nerdtree enhancement
let g:NERDTreeWinPos = "right"
map <F2> <ESC>:NERDTreeTabsToggle<CR>

" === Plugin 'jeetsukumaran/vim-buffergator'
" === Plugin 'kien/ctrlp.vim'
let g:ctrlp_by_filename = 1

" === Plugin 'rking/ag.vim'
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  nnoremap <Leader>f :Ag<SPACE>
  " nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

" === Plugin 'tpope/vim-rails'
" === Plugin 'MattesGroeger/vim-bookmarks'
let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
  nmap mm :BookmarkToggle<CR>
  nmap mi :BookmarkAnnotate<CR>
  nmap mn :BookmarkNext<CR>
  nmap mp :BookmarkPrev<CR>
  nmap ma :BookmarkShowAll<CR>
  nmap mc :BookmarkClear<CR>
  nmap mx :BookmarkClearAll<CR>
endfunction
function! BookmarkUnmapKeys()
  unmap mm
  unmap mi
  unmap mn
  unmap mp
  unmap ma
  unmap mc
  unmap mx
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_center = 1
let g:bookmark_disable_ctrlp = 1

" === Plugin 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" === Plugin 'editorconfig/editorconfig-vim'
" === Plugin 'tpope/vim-surround'
" === Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1

" === Plugin 'mattn/emmet-vim'
let g:user_emmet_leader_key = '<C-e>'

" === Plugin 'tpope/vim-repeat'
" === Plugin 'tmhedberg/matchit'
" === Plugin 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" === Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=238
hi IndentGuidesEven ctermbg=236
let g:indent_guides_guide_size = 1

" === Plugin 'MarcWeber/vim-addon-mw-utils'    " vim-snipmate dependency
" === Plugin 'tomtom/tlib_vim'                 " vim-snipmate dependency
" === Plugin 'garbas/vim-snipmate'
" === Plugin 'honza/vim-snippets'
" === Plugin 'pangloss/vim-javascript'
" let g:javascript_plugin_flow = 1
" === Plugin 'isRuslan/vim-es6'
" === Plugin 'mxw/vim-jsx'
" === Plugin 'vim-syntastic/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 2
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslint'
" === Plugin 'tpope/vim-fugitive'
" === Plugin 'airblade/vim-gitgutter'

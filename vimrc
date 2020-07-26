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
" Plugin 'jpo/vim-railscasts-theme'
Plugin 'morhetz/gruvbox'

" FileSystem Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'    "nerdtree enhancement

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'rking/ag.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'easymotion/vim-easymotion'
Plugin 'fatih/vim-go'
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
Plugin 'jparise/vim-graphql'

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
Plugin 'jiangmiao/auto-pairs'
Plugin 'Konfekt/FastFold'
Plugin 'elzr/vim-json'

" Language Plugin
Plugin 'pangloss/vim-javascript'
Plugin 'isRuslan/vim-es6'
Plugin 'maxmellon/vim-jsx-pretty'

" for ESlint rubocop
Plugin 'dense-analysis/ale'
Plugin 'prettier/vim-prettier'

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
colorscheme gruvbox

set guifont=Monaco:h14
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
set scrolloff=5
set nobackup
set noswapfile
set noundofile
" set timeoutlen=200

set hlsearch
set incsearch
set ignorecase
set smartcase

set showmatch
set matchtime=1
set iskeyword+=-

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
set cino=:0 " set switch case indent
set shiftround
set list
" set listchars=tab:\|\ ,
set listchars=tab:\.\ ,

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
" no need escape in regexp
nnoremap / /\v
vnoremap / /\v

" do not jump when star search
nnoremap * *``

augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>

  " open tag in new tab
  " nmap <silent><C-]> <C-w><C-]><C-w>T
  nmap gf <C-w>gf
  nmap <F4> :let @+=expand("%:p")<CR>
  " remove scrollbars
  set guioptions=
  " auto copy the mouse selection
  set guioptions+=a
endif



" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"


" ================ Plugin Settings ====================
" === Plugin 'morhetz/gruvbox'
" === Plugin 'scrooloose/nerdtree'
let g:nerdtree_tabs_open_on_gui_startup = 0
" === Plugin 'jistr/vim-nerdtree-tabs'    "nerdtree enhancement
let g:NERDTreeWinPos = "right"
map <F2> :NERDTreeTabsToggle<CR>
map <leader><F2> :NERDTreeFind<CR>

" === Plugin 'kien/ctrlp.vim'
" let g:ctrlp_by_filename = 1
" === Plugin 'rking/ag.vim'
if executable('ag')
  nmap <leader>f :Ag<space>
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" === Plugin 'tpope/vim-rails'
set confirm " to create alternate files
let g:rails_ctags_arguments = '--languages=ruby . $(bundle list --paths)'
" let g:rails_ctags_arguments = '--languages=ruby .'
let g:rails_projections = {
      \   "app/javascript/*/index.jsx": {
      \     "test": "spec/javascript/{}.spec.js",
      \   },
      \   "spec/javascript/*.spec.js": {
      \     "test": "app/javascript/{}/index.jsx",
      \   },
      \   "app/graphql/*.rb": {
      \     "rubyMacro": ["graphql_name", "field", "description", "argument", "graphql_name", "type"],
      \     "rubyHelper": ["context"],
      \   },
      \   "extras/*.rb": {
      \     "test": "spec/extras/{}_spec.rb"
      \   },
      \   "spec/extras/*_spec.rb": {
      \     "alternate": "extras/{}.rb"
      \   },
      \   "spec/factories/*.rb": {
      \     "command": "factory",
      \     "affinity": "collection",
      \     "keywords": "factory sequence"
      \   }
      \ }

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

" === Plugin 'fatih/vim-go'
let g:go_list_type = ""
let g:go_doc_keywordprg_enabled = 0

autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go setlocal iskeyword-=-

" === Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
" === Plugin 'editorconfig/editorconfig-vim'
" === Plugin 'tpope/vim-surround'
" === Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1

" === Plugin 'mattn/emmet-vim'
let g:user_emmet_settings={'javascript.jsx': {'extends':'jsx'}}
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
" === Plugin 'jiangmiao/auto-pairs'
" === Plugin 'Konfekt/FastFold'
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 0

" === Plugin 'pangloss/vim-javascript'
" === Plugin 'isRuslan/vim-es6'
" === Plugin 'w0rp/ale'
nmap <leader>j :ALENext<CR>

let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0

let g:ale_linters = {
\   'eruby': [],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}

" === Plugin 'prettier/vim-prettier'
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1
let g:prettier#exec_cmd_async = 1

" === Plugin 'tpope/vim-fugitive'
" === Plugin 'airblade/vim-gitgutter'




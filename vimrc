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
Plugin 'junegunn/fzf.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'easymotion/vim-easymotion'
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}

" Editor
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-repeat'
Plugin 'tmhedberg/matchit'
Plugin 'junegunn/vim-easy-align'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jiangmiao/auto-pairs'

" snippets
Plugin 'MarcWeber/vim-addon-mw-utils'    " vim-snipmate dependency
Plugin 'tomtom/tlib_vim'                 " vim-snipmate dependency
Plugin 'garbas/vim-snipmate'
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" folding
Plugin 'Konfekt/FastFold'
Plugin 'pedrohdz/vim-yaml-folds'
Plugin 'rlue/vim-fold-rspec'

" Language Plugin
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'leafOfTree/vim-vue-plugin'
Plugin 'isRuslan/vim-es6'
" Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'elzr/vim-json'
Plugin 'jparise/vim-graphql'
Plugin 'othree/html5.vim'

" for ESlint rubocop
Plugin 'dense-analysis/ale'

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
set virtualedit=block

filetype on
filetype indent on
filetype plugin on

set encoding=utf-8
set path+=~/project/openapply/app/models/fields
set path+=~/project/openapply/app/models/fields_data

"tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
" set cino=:0 " set switch case indent
set shiftround
set list
" set listchars=tab:\|\ ,
set listchars=tab:\.\ ,

set diffopt+=vertical

"key map
nmap <F10> :bd<CR>
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
nmap <S-Enter> o<Esc>
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
  " nmap gf <C-w>gf
  nmap <F4> :let @+=expand("%:p")<CR>
  " remove scrollbars
  set guioptions=
  " auto copy the mouse selection
  set guioptions+=a
endif

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"


" =====================================================
" ================ Plugin Settings ====================
" =====================================================
" === Plugin 'morhetz/gruvbox'
" === Plugin 'scrooloose/nerdtree'
let g:nerdtree_tabs_open_on_gui_startup = 0

" === Plugin 'jistr/vim-nerdtree-tabs'    "nerdtree enhancement
let g:NERDTreeWinPos = "right"
map <F2> :NERDTreeTabsToggle<CR>
map <leader><F2> :NERDTreeFind<CR>

" === Plugin 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf"
nmap <C-P> :Files<CR>
nmap <leader>f :Rg<space>

" === Plugin 'tpope/vim-rails'
set confirm " to create alternate files
let g:rails_ctags_arguments = '--languages=Ruby,JavaScript . $(bundle list --paths)'
let g:rails_projections = {
      \  "app/workers/*.rb": {
      \      "alternate": [
      \        "spec/workers/{}_spec.rb",
      \      ],
      \   },
      \  "app/models/concerns/*.rb": {
      \      "alternate": [
      \        "spec/models/concerns/{}_spec.rb",
      \        "spec/support/shared_examples/{}_spec.rb",
      \      ],
      \   },
      \  "spec/support/shared_examples/*_spec.rb": {
      \      "alternate": [
      \        "app/models/concerns/{}.rb",
      \      ],
      \   },
      \  "app/models/*.rb": {
      \      "test": [
      \        "spec/models/{}_spec.rb",
      \      ],
      \      "alternate": [
      \        "spec/models/{}_spec.rb",
      \      ],
      \   },
      \  "app/controllers/*_controller.rb": {
      \      "test": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/requests/{}_request_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \      "alternate": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/requests/{}_request_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \      "related": [
      \        "app/views/nv/{}/{define}.haml",
      \        "app/views/nv/{}/{define}.html.haml",
      \        "app/views/nv/{}/{define}.js.erb",
      \        "app/views/{}/{define}.haml",
      \        "app/views/{}/{define}.html.haml",
      \        "app/views/{}/{define}.js.erb",
      \      ],
      \   },
      \   "spec/requests/*_spec.rb": {
      \      "alternate": "app/controllers/{}_controller.rb"
      \   },
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

" === Plugin 'jiangmiao/auto-pairs'
" === Plugin 'MarcWeber/vim-addon-mw-utils'    " vim-snipmate dependency
" === Plugin 'tomtom/tlib_vim'                 " vim-snipmate dependency
" === Plugin 'garbas/vim-snipmate'
let g:snipMate = { 'snippet_version' : 1 }

" === Plugin 'SirVer/ultisnips'
" === Plugin 'honza/vim-snippets'

" === Plugin 'Konfekt/FastFold'
let g:fastfold_savehook = 1
set foldlevelstart=20

" === Plugin 'kchmck/vim-coffee-script'
" === Plugin 'pangloss/vim-javascript'
" === Plugin 'isRuslan/vim-es6'
" === Plugin 'dense-analysis/ale'

nmap <leader>j :ALENext<CR>
nmap <F12> :ALEFix<CR>

" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 0
let g:ale_set_highlights = 1
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
\   'eruby': ['rubocop'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'yaml': ['yamllint'],
\   'vue': ['eslint'],
\}
let g:ale_fixers = {
\   'vue': ['eslint', 'prettier'],
\   'javascript': ['eslint', 'prettier'],
\   'ruby': ['rubocop'],
\}

" === Plugin 'tpope/vim-fugitive'
" === Plugin 'airblade/vim-gitgutter'

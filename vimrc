 set nocompatible              " be iMproved, required
 filetype off                  " required

 "set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 "alternatively, pass a path where Vundle should install plugins
 "callvundle#begin('~/some/path/here')

 "let Vundle manage Vundle, required
 Plugin 'gmarik/Vundle.vim'

 Plugin 'tpope/vim-rails'
 Plugin 'stefanoverna/vim-i18n'

 "color scheme
 Plugin 'jpo/vim-railscasts-theme'
 " Plugin 'dolph/vim-colors-solarized-black'
 " Plugin 'altercation/vim-colors-solarized'
 Plugin 'bling/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 Plugin 'kchmck/vim-coffee-script'

 "FileSystem
 Plugin 'scrooloose/nerdtree'
 Plugin 'jistr/vim-nerdtree-tabs'
 Plugin 'scrooloose/nerdcommenter'
 Plugin 'kien/ctrlp.vim'
 Plugin 'rking/ag.vim'

 "move
 Plugin 'easymotion/vim-easymotion'

 "Edit
 Plugin 'tpope/vim-surround'
 Plugin 'mattn/emmet-vim'
 Plugin 'tpope/vim-repeat'
 Plugin 'tmhedberg/matchit'
 Plugin 'junegunn/vim-easy-align'
 Plugin 'nathanaelkane/vim-indent-guides'
 Plugin 'pangloss/vim-javascript'
 Plugin 'isRuslan/vim-es6'
 Plugin 'mxw/vim-jsx'

 Plugin 'MarcWeber/vim-addon-mw-utils'
 Plugin 'tomtom/tlib_vim'
 Plugin 'garbas/vim-snipmate'
 Plugin 'honza/vim-snippets'

 Plugin 'jeetsukumaran/vim-buffergator'

 "program
 Plugin 'MattesGroeger/vim-bookmarks'

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
 " set synmaxcol=140
 set ttyfast
 set lazyredraw
 colorscheme railscasts
 " set background=dark
 " colorscheme solarized

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

 "key map
 let mapleader="\<Space>"
 " nmap <tab> V>
 " nmap <s-tab> V<
 vmap <tab> >gv
 vmap <s-tab> <gv
 nmap <c-j> :m+1<CR>
 nmap <c-k> :m-2<CR>
 imap <c-k> <Up>
 imap <c-j> <Down>

 " next/prev quicklist item
 nmap <c-b> :cprevious<CR>
 nmap <c-n> :cnext<CR>
 nmap K i<CR><ESC>
 set pastetoggle=<F12>

 map <F2> <ESC>:NERDTreeTabsToggle<CR>
 map q: :q

 let g:NERDSpaceDelims=1
 let g:NERDTreeWinPos = "right"
 let g:user_emmet_leader_key = '<C-e>'
 let g:buffergator_viewport_split_policy="B"







 "set airline
 set laststatus=2
 let g:airline_powerline_fonts=1
 "enable tabline
 let g:airline#extensions#tabline#enabled = 1
 "set left separator
 let g:airline#extensions#tabline#left_sep = ' '
 "set left separator which are not editting
 let g:airline#extensions#tabline#left_alt_sep = '|'
 "show buffer number
 let g:airline#extensions#tabline#buffer_nr_show = 1
 let g:airline_theme='base16'



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
 " let g:bookmark_highlight_lines = 1
 let g:bookmark_center = 1


 let g:EasyMotion_do_mapping = 0 " Disable default mappings
 map  <Leader>w <Plug>(easymotion-bd-w)
 nmap <Leader>w <Plug>(easymotion-overwin-w)
 map  / <Plug>(easymotion-sn)
 omap / <Plug>(easymotion-tn)



 " Remove trailing whitespace when writing a buffer, but not for diff files.
 " From: Vigil <vim5632@rainslide.net>
 function RemoveTrailingWhitespace()
     if &ft != "diff"
         let b:curcol = col(".")
         let b:curline = line(".")
         silent! %s/\s\+$//
         silent! %s/\(\s*\n\)\+\%$//
         call cursor(b:curline, b:curcol)
     endif
 endfunction
 autocmd BufWritePre * call RemoveTrailingWhitespace()


 " The Silver Searcher
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


" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

" automatically load the .vimrc file whenever you save it.
" au BufWritePost .vimrc so $MYVIMRC

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


let g:rails_ctags_arguments = ['--languages=ruby --exclude=.git --exclude=log .']
set diffopt+=vertical

" vim-i18n
vmap <Leader>z :call I18nTranslateString()<CR>
vmap <Leader>dt :call I18nDisplayTranslation()<CR>

" 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=238
hi IndentGuidesEven ctermbg=236
let g:indent_guides_guide_size = 1

let g:jsx_ext_required = 0
autocmd BufNewFile,BufRead *.es6 set filetype=javascript.jsx

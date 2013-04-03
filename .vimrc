filetype off                   " requiired!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Color scheme
Bundle 'michalbachowski/vim-wombat256mod'

" Universal Syntax Checker + Completion
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'

" GO support
Bundle 'jnwhiteh/vim-golang'
Bundle 'nsf/gocode', {'rtp': 'vim/'}

" Python support
Bundle 'ivanov/vim-ipython'
Bundle 'nvie/vim-flake8'
Bundle 'hynek/vim-python-pep8-indent'

filetype plugin indent on     " required! 
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source: 
" https://github.com/mbrochh/vim-as-a-python-ide/blob/master/.vimrc
" https://github.com/yodiaditya/vim-pydjango/blob/master/.vimrc
" 
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Sets how many lines of history VIM has to remember
set history=1000
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Set to auto read when a file is changed from the outside
set autowrite

" Rebind <Leader> key
let mapleader = ","

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" TextMate\u2019s key mappings http://vimcasts.org/episodes/indentation-commands/
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set nowrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set so=7            " Set 7 lines to the curors - when moving vertical..
set ruler           "Always show current position
set hid             "Change buffer - without saving
set nohidden
set mouse=a
set nolazyredraw "Don't redraw while executing macros 
set showmatch "Show matching bracets when text indicator is over them

" No sound on errors
set noerrorbells
set novisualbell
set tm=500

"--- search options ------------
set incsearch       " show 'best match so far' as you type
set hlsearch        " hilight the items found by the search
set ignorecase      " ignores case of letters on searches
set smartcase       " Override the 'ignorecase' option if the search pattern contains upper case characters


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

set t_Co=256
color wombat256mod
highlight ColorColumn ctermbg=233
set cursorline
set colorcolumn=80 " Mark 80th column with a red line
highlight ColorColumn ctermbg=233


set encoding=utf8
try
	     lang en_US
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
" https://python-guide.readthedocs.org/en/latest/dev/env/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SuperTab plugin can be used to avoid needing to press Ctrl-X then Ctrl-O to invoke the popup completion menu. 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:SuperTabDefaultCompletionType = "context"
" Better navigating through omnicomplete option list
" " See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" "" set completeopt=longest,menuone
" "" function! OmniPopup(action)
" ""     if pumvisible()
" ""         if a:action == 'j'
" ""             return "\<C-N>"
" ""         elseif a:action == 'k'
" ""             return "\<C-P>"
" ""         endif
" ""     endif
" ""     return a:action
" "" endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GO support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost *.go :silent Fmt


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim-Ipython
source ~/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim

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
Bundle 'vim-scripts/indentpython.vim'
Bundle 'nvie/vim-flake8'

filetype plugin indent on     " required! 
syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM settings
" Source: https://github.com/mbrochh/vim-as-a-python-ide/blob/master/.vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" No sound on errors
set noerrorbells
set novisualbell
set tm=500

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed



" Mouse and backspace
set mouse=a
" "" set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


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
"
"
" " easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
" "" vnoremap < <gv  " better indentation
" "" vnoremap > >gv  " better indentation
"
"
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Showing line numbers, length, colors and fonts

set ruler           "Always show current position
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80

set t_Co=256
color wombat256mod
highlight ColorColumn ctermbg=233

set encoding=utf8
try
	     lang en_US
catch
endtry

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab



" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile


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
let g:SuperTabDefaultCompletionType = "context"
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
autocmd BufWritePost *.py call Flake8()

" Vim-Ipython
source ~/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim

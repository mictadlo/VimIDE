filetype off                   " requiired!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Color scheme
Bundle 'michalbachowski/vim-wombat256mod'

" Universal Syntax Checker + Completion
Bundle 'jnwhiteh/vim-golang'
Bundle 'nsf/gocode', {'rtp': 'vim/'}
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'

filetype plugin indent on     " required! 
syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
color wombat256mod


set encoding=utf8
try
     lang en_US
catch
endtry

autocmd BufWritePost *.go :silent Fmt


" SuperTab plugin can be used to avoid needing to press Ctrl-X then Ctrl-O to invoke the popup completion menu. 
let g:SuperTabDefaultCompletionType = "context"

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

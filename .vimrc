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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GO support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost *.go :silent Fmt

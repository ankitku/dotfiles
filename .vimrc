set showcmd

" 256 colors supported
let &t_Co=256

colorscheme papercolor 
set mouse=a

" Who doesn't like autoindent?
set autoindent
filetype indent on
set cinkeys=0{,0},:,0#,!^F
set number

"autocomplete
set wildmenu

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=3
set softtabstop=3

set pheader=%<%f%h%m\ %40{strftime(\"%c\",getftime(expand(\"%%\")))}%=Page\ %N

" Open Url on this line with the browser \w"
map <Leader>w :call Browser ()<CR>

execute pathogen#infect()

"Airline options
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='papercolor'
set laststatus=2

syntax on
filetype plugin on

au BufEnter *.hs compiler ghc

let g:haddock_browser = "/usr/bin/google-chrome"
let g:ghc = "/opt/ghc"
let g:haddock_docdir = "/opt/ghc/share/doc/ghc/html/"
" Syntastic options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_hs_checkers=['hdevtools','hlint']
let g:syntastic_enable_highlighting = 0
let g:syntastic_echo_current_error = 1 
let g:syntastic_haskell_hdevtools_args = "-g-Wall -g-XConstraintKinds -g-XCPP -g-XFlexibleContexts -g-fno-warn-unused-do-bind -g-ishared -g-isrc -g-idist/build/autogen -g-optP-include -g-optPdist/build/autogen/cabal_macros.h"
let g:syntastic_error_list_is_open = 0
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['tex'] }

function! GetNextSyntasticError(next)
    " If there's only one error, jump to it.
    if len(getloclist(0)) == 0
    elseif len(getloclist(0)) == 1
        ll
    " Else, if we're going forward, jump to the next error.
    elseif a:next
        lnext
    " Else, jump to the previous error.
    else
        lprev
    endif
endfunction

function! ToggleSyntasticErrorList()
    if g:syntastic_error_list_is_open
        " This should use lclose, as Synastic uses the location list. However,
        " for some reason lclose doesn't close it, but cclose does. Go with
        " what works.
        cclose
        " Added lclose too, as for some bizarre reason cclose does not work on
        " the DAS-4 linux boxes.
        lclose
        let g:syntastic_error_list_is_open = 0
    else
        " Open the Syntastic error window.
        Errors
        let g:syntastic_error_list_is_open = 1
    endif
endfunction

nnoremap <silent> <C-j> :call GetNextSyntasticError(1)<CR>
nnoremap <silent> <C-k> :call GetNextSyntasticError(0)<CR>
nnoremap <silent> \ :call ToggleSyntasticErrorList()<return>

let g:syntastic_auto_loc_list=1

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

" "Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" " Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

"neco-ghc settings
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1

let g:haskell_indent_if = 2 

map <C-n> :NERDTreeToggle<CR>
map <Tab> :bnext<CR>
map <S-Tab> :bprevious<CR>




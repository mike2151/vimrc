set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'zxqfl/tabnine-vim'
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'wincent/command-t'
Plugin 'hhvm/vim-hack'
Plugin 'dense-analysis/ale'
Plugin 'mxw/vim-xhp'
Plugin 'tpope/vim-sleuth'
call vundle#end()            " required
filetype plugin indent on    " required

set runtimepath+=~/.vim_runtime
set number
set autoindent

" There is no Hack auto indenter
autocmd FileType hack setlocal indentexpr=

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

let NERDTreeMapOpenInTab='\r'
let NERDTreeMapOpenInTab='<ENTER>'

set clipboard^=unnamed

if &term =~ "xterm" || &term =~ "screen"
    let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

let g:ale_linters = { 'hack': ['hack', 'hhast'] }
let g:ale_fixers = { 'hack': ['hackfmt', 'trim_whitespace', 'remove_trailing_lines'] }
let g:ale_fix_on_save = 1

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_filetypes = 'html,xhtml<Plug>PeepOpenhtml'

let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string"
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_select_previous_completion = ['<S-Tab>']

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

set iskeyword-=_

ca tn tabnew
ca th tabp
ca tl tabn
ca tc tabclose

inoremap jj <ESC>
map <Enter> o<ESC>
map <S-Enter> <S-o><ESC>

iunmap $e
iunmap $q
noremap <Tab> :><CR>
noremap <S-Tab> :<<CR>
vmap <Tab> :>
vmap <S-Tab> :<

imap <C-n> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

:ca WQ wq
:ca W w

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

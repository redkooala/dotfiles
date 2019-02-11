"pgugins"
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-ruby/vim-ruby'

"colorshemes"
Plugin 'morhetz/gruvbox'
Plugin 'Yggdroot/indentLine'
"Plugin 'mhinz/vim-startify'
"test pluggins
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'easymotion/vim-easymotion'
"search for files
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'slim-template/vim-slim'
Plugin 'pangloss/vim-javascript' 
Plugin 'mxw/vim-jsx' 
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
"linters"
Plugin 'w0rp/ale'

"*************Autocomplete Plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'phpactor/phpactor'
Plugin 'shawncplus/phpcomplete.vim'
"Plugin 'arnaud-lb/vim-php-namespace'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"params"
syntax on
colorscheme gruvbox
set background=dark
set number
set expandtab
set tabstop=4
set hlsearch
set incsearch
set expandtab
set shiftwidth=4
set softtabstop=4

" tab size for not expanded files
let g:indentLine_color_term = 239
let g:indentLine_conceallevel = 2
let g:indentLine_faster = 0
let g:mapleader=','

let g:jsx_pragma_required = 0 

" *** ale config
let g:ale_emit_conflict_warnings = 1
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'php': ['phpcs'],
      \}

let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'php': ['phpcs'],
      \}
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 0

autocmd BufEnter *.cpp ALEDisable
autocmd BufEnter *.h ALEDisable

highlight link ALEWarningSign todo
highlight link ALEErrorSign todo


let &colorcolumn=join(range(81,999),",")
"disable node_modules for ctrlp
set wildignore+=node_modules/**
set wildignore+=*/node_modules/**
set wildignore+=public/**
set wildignore+=*/tmp/*,*/log/*,*.so,*.swp,*.zip,moc_*.cpp,moc_*.h,ui_*.cpp,ui_*.h

"#### SNIPET ####"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"Snipets end ***********"

"****************"
let mapleader = "\<Space>"
map <Leader>n :NERDTreeToggle<CR>
map <Leader>p :NERDTreeFind<cr>
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>q :echo "noh"

"*****************END MAPPING ************

"PHP AUTOCOMPLETE FUCTIONS"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php setlocal omnifunc=phpactor#Complete
""nmap <C-]> :call phpactor#GotoDefinition()<CR>



"#### TAGS ####"
set tags+=tags,tags.vendors


"orfography"
set spell spelllang=ru

set nocompatible 

"### VUNDLE ###"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-ruby/vim-ruby'

"colorshemes"
Plugin 'morhetz/gruvbox'
Plugin 'Yggdroot/indentLine'

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

"SNIPPETS
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

"LINTERS"
Plugin 'w0rp/ale'

"AUTOCOMPLETE TODO
"Plugin 'phpactor/phpactor'
"Plugin 'phpactor/ncm2-phpactor'

Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-path'
Plugin 'ncm2/ncm2-ultisnips'

"### PHP LANG SERVER"
Plugin 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plugin 'junegunn/fzf'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"### VIM PARAMS ###"
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

let g:indentLine_color_term = 239
let g:indentLine_conceallevel = 2
let g:indentLine_faster = 0

"### MAP ###"
let g:mapleader=','
let g:jsx_pragma_required = 0 

"PLUGINS CONFIGURATION"
"ale
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
"ctl+p
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

"****************"
let mapleader = "\<Space>"
map <Leader>n :NERDTreeToggle<CR>
map <Leader>p :NERDTreeFind<cr>
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>q :echo "noh"


"PHP ACTOR TODO
autocmd FileType php setlocal omnifunc=phpactor#Complete
nmap <C-]> :call phpactor#GotoDefinition()<CR>
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"SPELLS"
set spell
set spl=ru,en
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd FileType gitcommit setlocal spell


"PHP LANGUAGE SERVER"
set runtimepath+=~/.vim-plugins/LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'php': ['tcp://127.0.0.1:4001'],
    \ }

"#### TAGS ####"
set tags+=tags,tags.vendors

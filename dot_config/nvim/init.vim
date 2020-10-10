 syntax on
"set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set cindent
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undofile
set incsearch
set guicursor+=i:hor20-Cursor/lCursor
set laststatus=0

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-sneak'
Plug 'SirVer/ultisnips'
Plug 'morhetz/gruvbox'
call plug#end()

let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:sneak#label = 1
" set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme PaperColor
" colorscheme gruvbox
nmap <space>ff :Files<CR>
let mapleader = " "
nnoremap <leader>fs :w<CR>
nnoremap <leader>bk :bd!<CR>
nnoremap <leader>qq :q<CR>
nnoremap <F9> :w <bar> :make '%:r'<CR>
nnoremap <F8> :suspend<CR>
map <C-a> <ESC>^
imap <C-a> <ESC>I
let g:airline_theme='papercolor'
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
tnoremap <Esc> <C-\><C-n>

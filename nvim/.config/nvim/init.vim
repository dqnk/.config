"plugins - vim-plug
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/LargeFile'
Plug 'ekickx/clipboard-image.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'codota/tabnine-vim'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tabnine/YouCompleteMe'
Plug 'gko/vim-coloresque'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'yegappan/mru'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'chrisbra/csv.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'

call plug#end()

"
set encoding=UTF-8
set updatetime=100
set synmaxcol=1024
set textwidth=80
set nocompatible
filetype plugin on
syntax enable
set tabstop=8
set signcolumn=yes
colorscheme vim-monokai-tasty
highlight Normal ctermbg=none
highlight NonText ctermbg=none
set showcmd
set smartindent
set cursorline
set relativenumber
set nu rnu
set foldmethod=indent
set clipboard+=unnamedplus
set wmh=0

let g:python_highlight_all = 1
let g:ale_enabled=0

let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1

let g:ycm_filetype_blacklist = {}

let g:netrw_keepdir=0
let &colorcolumn = join(range(81,999), ',')

autocmd StdinReadPre * let s:std_in=1

"autocmd VimEnter * NERDTree | set relativenumber | set nu rnu | if argc() > 0 || exists("s:std_in") | wincmd p | endif

autocmd VimEnter *
                \   if !argc() 
                \ |   Startify
                \ |   NERDTree
		\ |   set relativenumber
		\ |   set nu rnu
                \ |   wincmd w
                \ | endif

autocmd FileType arduino nmap <F8> :!arduino-cli compile --fqbn arduino:avr:uno
autocmd FileType arduino nmap <F9> :!arduino-cli upload -p /dev/ttyUSB0 --fqbn arduino:avr:uno

tnoremap <Esc> <C-\><C-n>
map <F3> :NERDTreeFind<CR>
map <C-e> :NERDTreeToggle<CR>
map <C-s> :pyf /usr/share/clang/clang-format.py<cr>

noremap <C-x> :q<cr>

autocmd FileType cpp nmap <F5> :!./%:r<CR>
autocmd FileType cpp nmap <F8> :make %:r && ./%:r<CR>
autocmd Filetype cpp nmap <F9> :!g++ -std=c++17 -Wshadow -Wall -o %:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:r<CR>

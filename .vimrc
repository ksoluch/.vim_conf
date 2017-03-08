execute pathogen#infect()
syntax on
filetype plugin indent on

"for windows, gvim specific settings
"set guifont=DejaVu\ Sans\ Mono\ 11
"set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
"set guioptions-=r  "remove right-hand scroll bar
"set guioptions-=L  "remove left-hand scroll bar

colorscheme molokai

let mapleader=" "

set laststatus=2
set hidden
set wildignore+=*/obj/**
set wildignore+=*/out/**
"set guifont=Inconsolata\ for\ Powerline:h14
set expandtab
set tabstop=3
set shiftwidth=3
set number
set clipboard=unnamed
set nowrap
set hlsearch
set term=screen-256color
set relativenumber
set foldmethod=indent

"nice cursor in the insert mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
   let &t_SI = "\<Esc>[5 q"
   let &t_EI = "\<Esc>[2 q"
endif

"Key mappings
nnoremap <silent><leader>9 : set relativenumber<CR>
nnoremap <silent><leader>0 : set norelativenumber<CR>

" P = full path
nnoremap <silent><leader>p :let @* = expand("%:p")<CR>
" SHIFT+P = file name
nnoremap <silent><leader>P :let @* = expand("%:t")<CR>
" CTRL+P = parent folder
nnoremap <silent><leader><S-p> :let @* = expand("%:p:h")<CR>
" save
nnoremap <silent><leader>1 :w!<CR>
" close
nnoremap <silent><leader>3 :q<CR>

" open in current directory
nnoremap <silent><leader>n :NERDTreeToggle<CR>
nnoremap <silent><leader>N :NERDTreeFind<CR>

nnoremap <silent><leader>b :LustyBufferGrep<CR>
nnoremap <silent><leader>B :CommandTBuffer<CR>

nnoremap <silent><leader>w :CommandTLine<CR>
nnoremap <silent><leader>W :CommandTTag<CR>

nnoremap <silent><leader>f :CommandT<CR>
nnoremap <silent><leader>F :CommandT %:p:h<CR>

nnoremap <leader>A :Ack --type=cpp ""<Left>
nnoremap <silent><leader>a :Ack --type=cpp <C-r><C-W><CR>
nnoremap <silent><leader><C-a> :Ack --type=cpp <C-r><C-W><CR>

nnoremap <leader>Z :Ack --type=cc ""<Left>
nnoremap <silent><leader>z :Ack --type=cc <C-r><C-W><CR>
nnoremap <silent><leader><C-z> :Ack --type=cc <C-r><C-W><CR>

nnoremap <leader>t :TlistToggle<CR><C-h><C-h>

nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-x> <C-W>c

nnoremap <silent>= O<Esc>
nnoremap <silent>- o<Esc>

nnoremap <silent><leader>[ :vertical resize -5<CR>
nnoremap <silent><leader>] :vertical resize +5<CR>
nnoremap <silent><leader>= :resize +5<CR>
nnoremap <silent><leader>- :resize -5<CR>

nnoremap <silent><leader>e :only<CR>
nnoremap <silent><leader>r :tabe %<CR>
nnoremap <silent><leader>v :vsplit %<CR>
nnoremap <silent><leader>s :split %<CR>
nnoremap <silent><leader>d :g/<C-r><C-W><CR>
nnoremap <leader>D :g/

nnoremap <silent><leader>l :ls<CR>
nnoremap * *N

nmap <leader>c <Plug>(Scalpel)
vmap <leader>y "+y

nnoremap <leader><leader> <C-^>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

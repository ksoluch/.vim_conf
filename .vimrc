execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme molokai

let mapleader=" "
let CommandTMaxFiles=1000000
let CommandTTraverseSCM='pwd'
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
set foldlevel=0

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

"full path
nnoremap <silent><leader>p :let @* = expand("%:p")<CR>
"file name
nnoremap <silent><leader>P :let @* = expand("%:t")<CR>
"parent folder
nnoremap <silent><leader><C-p> :let @* = expand("%:p:h")<CR>
"
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

"search the word under the cursor
nnoremap <silent><leader>a :Ack --cpp --cc <C-r><C-W><CR>
"type the search phrase
nnoremap <leader>A :Ack --cpp --cc ""<Left>
"take the word under the cursor as a base for the search phrase
nnoremap <leader><C-a> :Ack --cpp --cc "<C-r><C-W>"<Left>

nnoremap <leader>t :TlistToggle<CR><C-h><C-h>

nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-x> <C-W>c

nnoremap <silent><C-s> s<Esc><Esc>

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

nnoremap <leader>l1 :set foldlevel=1<CR>
nnoremap <leader>l2 :set foldlevel=100<CR>

let g:clang_format#code_style = "chromium"
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : 0,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

vmap <silent>= :ClangFormat<CR>
nmap <silent><leader>= :<C-u>ClangFormat<CR>

"concert to hex
" %!xxd
"reverse back to bin
" %!xxd -r

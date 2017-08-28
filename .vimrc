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
set foldlevel=10

"nice cursor in the insert mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
   let &t_SI = "\<Esc>[5 q"
   let &t_EI = "\<Esc>[2 q"
endif

"Key mappings
nnoremap <silent><leader>0 : set norelativenumber<CR>
nnoremap <silent><leader>9 : set relativenumber<CR>

"TODO: test configuration, remove if not needed
"disables comparing whitespaces in vimdiff
nnoremap <silent><leader>5 : set diffopt+=iwhite<CR>

"full path
nnoremap <silent><leader>p :let @* = expand("%:p")<CR>
"file name
nnoremap <silent><leader>P :let @* = expand("%:t")<CR>
"parent folder
nnoremap <silent><leader><C-p> :let @* = expand("%:p:h")<CR>

" save
nnoremap <silent><leader>1 :w!<CR>
" close
nnoremap <silent><leader>3 :q<CR>

" open in current directory
nnoremap <silent><leader>n :NERDTreeToggle<CR>
nnoremap <silent><leader>N :NERDTreeFind<CR>

"nnoremap <silent><leader>b :LustyBufferGrep<CR>
nnoremap <silent><leader>B :CommandTBuffer<CR>

nnoremap <silent><leader>w :CommandTLine<CR>
nnoremap <silent><leader>W :CommandTTag<CR>

nnoremap <silent><leader>f :CommandT<CR>

"search the word under the cursor
nnoremap <silent><leader>A :Ack! --asm --cpp --cc <C-r><C-W><CR>
"type the search phrase
nnoremap <leader>a :Ack! --asm --cpp --cc ""<Left>
"take the word under the cursor as a base for the search phrase
nnoremap <leader><C-a> :Ack! --asm --cpp --cc "<C-r><C-W>"<Left>

nnoremap <leader>t :TlistToggle<CR><C-h><C-h>

nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-x> <C-W>c

"create new line below and go there
nnoremap <silent>1 o<Esc><Esc>
"create new line above and go there
nnoremap <silent>2 O<Esc><Esc>

nnoremap <silent><C-s> s<Esc><Esc>

nnoremap <silent><leader>[ :vertical resize -5<CR>
nnoremap <silent><leader>] :vertical resize +5<CR>
nnoremap <silent><leader>+ :resize +5<CR>
nnoremap <silent><leader>_ :resize -5<CR>

nnoremap <silent><leader>e :only<CR>
nnoremap <silent><leader>r mm:tabe %<CR>'m
nnoremap <silent><leader>v mm:vsplit %<CR>'m
nnoremap <silent><leader>s mm:split %<CR>'m
nnoremap <silent><leader>R :tabe %<CR>
nnoremap <silent><leader>V :vsplit %<CR>
nnoremap <silent><leader>S :split %<CR>
nnoremap <silent><leader>D :g/<C-r><C-W><CR>
nnoremap <leader>d :g/

nnoremap * *N
nnoremap <silent><leader>* :nohlsearch<CR>

nmap <leader>c <Plug>(Scalpel)
vmap <leader>y "+y

nnoremap <leader><leader> <C-^>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <leader>l1 :set foldlevel=1<CR>
nnoremap <leader>l2 :set foldlevel=100<CR>

let g:clang_format#command = "clang-format-4.0"
let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
            \ "IndentWidth" : 3,
            \ "BreakBeforeBraces" : "Linux",
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "IndentCaseLabels" : "false"}

vmap <silent>= :ClangFormat<CR>
nmap <silent><leader>= :<C-u>ClangFormat<CR>

nnoremap <leader>ba :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol 
nnoremap  <leader>bs :call CscopeFind('s', expand('<cword>'))<CR> 
" g: Find this definition 
nnoremap  <leader>bg :call CscopeFind('g', expand('<cword>'))<CR> 
" d: Find functions called by this function 
nnoremap  <leader>bd :call CscopeFind('d', expand('<cword>'))<CR> 
" c: Find functions calling this function 
nnoremap  <leader>bc :call CscopeFind('c', expand('<cword>'))<CR> 
" t: Find this text string 
nnoremap  <leader>bt :call CscopeFind('t', expand('<cword>'))<CR> 
" e: Find this egrep pattern 
nnoremap  <leader>be :call CscopeFind('e', expand('<cword>'))<CR> 
" f: Find this file 
nnoremap  <leader>bf :call CscopeFind('f', expand('<cword>'))<CR> 
" i: Find files #including this file 
nnoremap  <leader>bi :call CscopeFind('i', expand('<cword>'))<CR> 

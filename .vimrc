syntax on

set noerrorbells
set noswapfile
set number
set noerrorbells
set colorcolumn=100
au GUIEnter * simalt ~x
set cb=unnamed
set gfn=Fixedsys:h10
set ts=4
set sw=4

map <Down> <NOP>
map <Up> <NOP>
map <Left> <NOP>
map <Right> <NOP>

inore jj <Esc>

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F10> :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

call plug#begin('~/.vim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'
Plug 'davidhalter/jedi-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'valloric/youcompleteme'
Plug 'morhetz/gruvbox'
"for auto completion for html tags
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
call plug#end()

"grubbox config
colorscheme gruvbox
set background=dark




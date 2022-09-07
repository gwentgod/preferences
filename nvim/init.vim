syntax on

set hidden
set updatetime=100

set mouse=

set clipboard+=unnamedplus

set nowrap
set guicursor=
set number
set signcolumn=number
set scrolloff=5
set sidescrolloff=12
set smartindent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set incsearch nohlsearch
set ignorecase smartcase

set splitbelow
set splitright


cnoreabbrev W  w
cnoreabbrev Q  q
cnoreabbrev WQ wq
cnoreabbrev Wq wq

vnoremap J j
noremap K k

map ; %
noremap E $
noremap B ^

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-b> <Home>
inoremap <C-e> <End>
inoremap <C-o> <C-o>o

noremap <C-b> <C-w>
noremap <C-b><C-b> <C-w>s:e .<Return>

nnoremap U     <C-r>
nnoremap <C-r> :call Run()<Return>

source $HOME/.config/nvim/hikari.vim
source $HOME/.config/nvim/leap.vim

function ReplaceName()
    %s/<filename>/\=expand('%:t:r')
endfunction
autocmd BufNewFile *.tex  0r ~/.config/nvim/skel/tex.tex
autocmd BufNewFile *.html 0r ~/.config/nvim/skel/html.html
autocmd BufNewFile *.vhd  0r ~/.config/nvim/skel/vhd.vhd | call ReplaceName() | 1


if empty(glob($HOME.'/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl --fail --location --output $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    source $HOME/.local/share/nvim/site/autoload/plug.vim
    source $HOME/.config/nvim/plugs.vim
    PlugInstall
endif
source $HOME/.config/nvim/plugs.vim


" terminal
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert

function Split() abort
    :split
    :wincmd j
    :set nonu
    :resize +3
endfunction

nnoremap <C-t> :call Split()<Return>:term

function Run() abort
    :w
    if &filetype == 'c'
        exec '!gcc % -o %<.out'
        :call Split()
        :term ./%<.out
    elseif &filetype == 'cpp'
        exec '!g++ -std=c++11 % -Wall -o %<.out'
        :call Split()
        :term ./%<.out
    elseif &filetype == 'python'
        :call Split()
        :term python3 %
    elseif &filetype == 'java'
        exec '!javac %'
        :call Split()
        :term java %
    elseif &filetype == 'javascript'
        :call Split()
        :term node %
    elseif &filetype == 'go'
        :call Split()
        :term go run %<.go
    elseif &filetype == 'sh'
        :call Split()
        :term bash %
    elseif &filetype == 'markdown'
        :MarkdownPreview
    elseif &filetype == 'tex'
        :silent! VimtexCompileSS
    endif
endfunction

call plug#begin()
    Plug 'tpope/vim-commentary'
    Plug 'andymass/vim-matchup'
    Plug 'gcmt/wildfire.vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'godlygeek/tabular'
    Plug 'mg979/vim-visual-multi'
    Plug 'mhinz/vim-signify'
    Plug 'github/copilot.vim'
    Plug 'honza/vim-snippets'
    Plug 'dense-analysis/ale'
    Plug 'iamcco/markdown-preview.nvim',
        \ { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim'] }
    Plug 'lervag/vimtex', { 'for': ['tex'] }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-clangd',
    \ 'coc-pyright',
    \ 'coc-sh',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-vimtex',
    \ 'coc-docker',
    \ 'coc-snippets'
\]


let g:ale_disable_lsp = 1

let g:VM_maps = {
    \ 'Undo': 'u',
    \ 'Redo': 'U',
    \ 'Select Cursor Down': '<C-j>',
    \ 'Select Cursor Up': '<C-k>'
\}

let g:mkdp_page_title = '${name}'

let g:vimtex_compiler_latexmk = {
    \ 'build_dir': 'tex_build',
    \ 'options': ['--shell-escape']
\}
" let g:vimtex_view_general_viewer = 'mupdf'
" let g:vimtex_view_general_options = "-a 'Visual Studio Code' --args @pdf"

imap <silent><script><expr> <C-f> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-b>'
imap <C-n> <Plug>(coc-snippets-expand-jump)

inoremap <expr> <Tab>
    \ coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"

inoremap <expr> <S-Tab>
    \ coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

inoremap <expr> <CR> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nnoremap ?? :SignifyHunkDiff<CR>
cnoreabbrev rev SignifyHunkUndo

vnoremap t :Tabularize /

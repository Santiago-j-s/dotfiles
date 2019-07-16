call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'StanAngeloff/php.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/IndexedSearch'
Plug 'Townk/vim-autoclose'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'valloric/MatchTagAlways'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'sbdchd/neoformat'
Plug 'majutsushi/tagbar'
" Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'} requires PHP7.1+
" Plug 'phpactor/ncm2-phpactor'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-ultisnips'
Plug 'sirver/ultisnips'
call plug#end()

" fix weird symbols
" https://github.com/neovim/neovim/wiki/FAQ#nvim-shows-weird-symbols-2-q-when-changing-modes
:set guicursor=
:autocmd OptionSet guicursor noautocmd set guicursor=

" tabs and spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" go to end of delimiter character in insert mode
inoremap <C-e> <C-o>A

" clear highlight
nnoremap <F3> :noh<CR>

" startify
nnoremap <F2> :Startify<CR>

" tagbar
nnoremap <F4> :TagbarToggle<CR>

" Include user statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Include user statement
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" tab navigation mappings
map tt :tabnew

" show line numbers
set number

" show whitespace
set list

" mouse support
set mouse=a

" remove ugly vertical lines on window division
set fillchars+=vert:\ 

" fix color for dark backgrounds
" set background=dark

" support for truecolor (24-bit)
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" colorscheme
colorscheme night-owl

" use 256 colors when possible
" if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
"    let &t_Co = 256
" endif

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/bash 

" signify colors
highlight SignColumn    ctermbg=233 cterm=NONE guibg=#011627 gui=NONE
highlight DiffAdd       cterm=bold ctermbg=233 guibg=#011627 guifg=#addb67
highlight DiffDelete    cterm=bold ctermbg=233 guibg=#011627 guifg=#ef5350 ctermfg=167
highlight DiffChange    cterm=bold ctermbg=233 guibg=#011627 guifg=#a2bffc ctermfg=227

" use ag in place of ack if available
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" parameter expansion
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

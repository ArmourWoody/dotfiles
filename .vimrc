" General
filetype plugin on
filetype indent on
set autoread
let mapleader = " "

" UI
syntax on
set background=dark
set ruler
set backspace=eol,start,indent
set ignorecase
set smartcase
set incsearch
set lazyredraw
set nohlsearch
set magic
set showmatch
set foldcolumn=1
set number
set laststatus=2
"inoremap <expr> <Tab> pumvisible() ? '<C-n>' ?
"            \ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : <Tab>

" NetRW
let g:netrw_banner = 0
let g:netrw_winsize = 25
nnoremap <Leader>t :Lex<CR>

"Files, backups and undo
set nobackup
set nowb
set noswapfile
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Text/Indent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set nowrap


" Quick fix
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" Vim Plug
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'w0rp/ale'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'OmniSharp/omnisharp-vim'
call plug#end()
colorscheme gruvbox

" ALE
let g:ale_linters = { 'cs' : ['OmniSharp'] }

" FZF
nmap <Leader><Tab> <Plug>(fzf-maps-n)
nmap <Leader>p :Files<CR>

" OmniSharp
let g:OmniSharp_server_stdio = 1
set previewheight=10
let g:OmniSharp_timeout = 5
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_autoselect_existing_sln = 1
let g:OmniSharp_popup_position = 'peek'
set completeopt=longest,menuone,preview

augroup omnisharp_commands
    autocmd!
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader><Space> :OmniSharpGetCodeActions<CR>
    autocmd FileType cs xnoremap <buffer> <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
    autocmd FileType cs nnoremap <buffer> <F2> :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>cf :OmniSharpCodeFormat<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>rt :OmniSharpRunTest<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>rT :OmniSharpRunTestsInFile<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>ss :OmniSharpStartServer<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>sp :OmniSharpStopServer<CR>

augroup END

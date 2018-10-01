" python pyenv
let g:python3_host_prog = '/Users/Finn/.pyenv/shims/python3'

" map Leader to Space
let mapleader="\<SPACE>"

" map write to leader w
nnoremap <Leader>w :w<CR>

" map buffer close to leader bq
nnoremap <Leader>bd :bd<CR>

" map PlugInstall to leader s
nnoremap <Leader>i :PlugInstall<CR>

" Source vimrc on leader r
nnoremap <Leader>r :source $MYVIMRC<CR>

map <Leader>bl :Bufferlist<CR>

" Open previous file
nmap <Leader><Leader> <c-^>

" tab between buffers
nnoremap <Leader>] :bnext!<CR>
nnoremap <Leader>[ :bprev!<CR>

" Resize
nnoremap <silent> <Leader>+ :resize +10<CR>
nnoremap <silent> <Leader>- :resize -10<CR>
nnoremap <silent> <Leader>< :vertical resize -10<CR>
nnoremap <silent> <Leader>> :vertical resize +10<CR>

"Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTree' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'sandeepcr529/Buffet.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'jparise/vim-graphql' 

Plug 'mattn/emmet-vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

Plug 'w0rp/ale'
Plug 'justinmk/vim-sneak'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'skywind3000/asyncrun.vim'

Plug 'Shougo/unite.vim'
Plug 'dracula/vim', { 'as': 'Dracula' }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'mhinz/vim-grepper'
Plug 'matze/vim-move'
Plug 'tpope/vim-fugitive'
Plug 'cakebaker/scss-syntax.vim'

call plug#end()

" Set Theme
color Dracula
syntax on
set termguicolors



" Nerdtree
autocmd vimenter * NERDTree
" nnoremap <Leader>\ :NERDTreeToggle<Enter>
" nnoremap <Leader>/ :NERDTreeFind<CR>
"autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"let NERDTreeQuitOnOpen = 1
"
" NerdTree Tabs
map <Leader>\ <plug>NERDTreeTabsToggle<CR>
map <Leader>/ <plug>NERDTreeTabsFind<CR>

" ALE
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1 " Less distracting when opening a new file
" eslint with prettier
autocmd BufWritePost *.js AsyncRun -post=checktime eslint --fix %
let g:ale_linters = {}
let g:ale_linters.javascript = ['eslint']
let g:ale_linters.graphql = ['eslint']
let g:ale_linters.scss = ['stylelint']
let g:ale_linters.css = ['stylelint']
let g:ale_linters.python = ['yapf']
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers.graphql = ['prettier']
let g:ale_fixers.json = ['prettier']
let g:ale_fixers.scss = ['prettier']
let g:ale_fixers.css = ['prettier']
let g:ale_fixers.python = ['yapf']
let g:ale_javascript_prettier_use_global = 1
nnoremap <Leader>d :ALEFix<CR>

" Autopairs
let g:AutoPairsFlyMode = 1

" Grepper Find in Files
nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>

" Indent Lines
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

" airline settings
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2
set guifont=Fira\ Mono\ for\ Powerline

" Emmet
let g:user_emmet_leader_key='<C-n>'

" Fuzzy Find
nnoremap <Leader>p :CtrlP<CR>
nnoremap <C-p> :CtrlP<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules\|\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" YouCompleteMe
let g:ycm_key_eist_select_completion = ['<TAB>', '<Down>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

" UltiSnip
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"


" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Sneaks
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F




" Set standard file encoding
set encoding=utf-8
" No special per file vim override configs
set nomodeline
" Stop word wrapping
set nowrap
  " Except... on Markdown. That's good stuff.
  autocmd FileType markdown setlocal wrap
" Adjust system undo levels
set undolevels=100
" Use system clipboard
" set clipboard=unnamed
" Set tab width and convert tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" Don't let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells
" Number gutter
set number                     " Show current line number
set relativenumber             " Show relative line numbers
" Use search highlighting
set hlsearch
" Space above/beside cursor from screen edges
set scrolloff=1
set sidescrolloff=5
" set the language
set langmenu=en_US.UTF-8
set noswapfile

" remove Mouse
set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

scriptencoding utf-8

""Plugins folder
call plug#begin('~/.local/share/nvim/plugged')
""unite
Plug 'Shougo/unite.vim'
" Themes
Plug 'kaicataldo/material.vim'
Plug 'dikiaap/minimalist'
Plug 'tyrannicaltoucan/vim-quantum' 
Plug 'mhartington/oceanic-next'
Plug 'ayu-theme/ayu-vim'
" colors
Plug 'lilydjwg/colorizer'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
""CtrlP
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
"vim-grepper
Plug 'mhinz/vim-grepper'
" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier'
Plug 'skywind3000/asyncrun.vim'
"html
Plug 'valloric/matchtagalways'
Plug 'alvan/vim-closetag'
"emmet
Plug 'mattn/emmet-vim' 
" identacion
Plug 'Yggdroot/indentLine'
" resaltado de sintaxis
Plug 'sheerun/vim-polyglot'
" autocomplete
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" vim-sneak
Plug 'justinmk/vim-sneak'
" Nerd 
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
"navigation between nvim and tmux
Plug 'christoomey/vim-tmux-navigator'
" auto pairs
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
" icons
Plug 'ryanoasis/vim-devicons'
call plug#end()
" end plugins

" General
set nocompatible
filetype plugin indent on
set number	" Show line numbers
set title
set relativenumber
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set spelllang=en,es
set background=dark
set termguicolors
set colorcolumn=100  " Set & show limit column
set scrolloff=3  " Display at least 3 lines around you cursor
set sidescrolloff=5
set diffopt+=vertical  " Always use vertical diffs
colorscheme material
let g:material_theme_style = 'dark' "| 'palenight' | 'defult'
"colorscheme OceanicNext
"colorscheme quantum
"let ayucolor="mirage"
"let ayucolor="dark"
"colorscheme ayu
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
set wrap
set scrolloff=5
set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set cursorline
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=2	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab
syntax enable " Turn on syntax highlighting
set hidden " Leave hidden buffers open
set history=100 "by default Vim saves your last 8 commands.  We can handle more
set ruler	" Show row and column ruler information
set autoread
set noswapfile
set undolevels=100	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
" Open new splits to right and bottom
set splitbelow
set splitright

""avoid vim backups
set nowritebackup
set noswapfile
set nobackup

"python
let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python3"

" mappings """"""""""""""""""""""""""
nnoremap <C-s> :w<CR>
let mapleader="\<SPACE>"  " Definir espacio como la tecla líder

nnoremap <leader>e :e $MYVIMRC<CR>  " Abrir el archivo init.vim con <líder> + e
nnoremap <CR> :noh<CR><CR> " tourn searh highlighting off

"change between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <leader><leader> <c-^>
" Usar <líder> + y para copiar al portapapeles
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Usar <líder> + d para cortar al portapapeles
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Usar <líder> + p para pegar desde el portapapeles
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" Moverse al buffer siguiente con <líder> + l
nnoremap <Tab> :bnext<CR>

" Moverse al buffer anterior con <líder> + j
nnoremap <S-Tab> :bprevious<CR>

" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>

" Navegación entre ventanas
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

"arrow keys resize panes
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>
""" Aireline theme
let g:airline_theme='hybrid'
let g:powerline_pycmd="py3"
let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" prettier
let g:prettier#autoformat = 1
autocmd BufWritePre *.jsx,*.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

" "'' ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" emmet
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" w0rp/ale
nmap <leader>d <Plug>(ale_fix)
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1 " Less distracting when opening a new file
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_fixer = {
  \ 'javascript': ['eslint']
  \ }
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
" Mostrar mejor mensajes de error
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" javascript
let g:javascript_plugin_jsdoc = 1
" No mostrar en ciertos tipos de buffers y archivos
let g:identLine_enable=1
let g:identLine_char="⟩"
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
"ctrlp"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "exclude folders in gitIgnore
let g:ctrlp_show_hidden = 1 
" grepper
nnoremap <leader>fp :Grepper<Space>-query<space> " buscar en proyecto
nnoremap <leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space> " buscar en buffer actual
" deoplete
let g:deoplete#enable_at_startup=1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"gutentags file
let g:gutentags_cache_dir="/media/data/.tags"
" NERDtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-b> :NERDTreeToggle<CR>
map <C-n> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
"autoformat
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %


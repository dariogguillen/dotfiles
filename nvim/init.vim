scriptencoding utf-8
" .........................................................
" # Plugins
" .........................................................
" Plugins folder
call plug#begin('~/.local/share/nvim/plugged')
" Themes
Plug 'kaicataldo/material.vim'
Plug 'dikiaap/minimalist'
Plug 'tyrannicaltoucan/vim-quantum' 
" colors
Plug 'lilydjwg/colorizer'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier'
Plug 'skywind3000/asyncrun.vim'
"emmet
Plug 'mattn/emmet-vim' 
" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
" identacion
Plug 'Yggdroot/indentLine'
" resaltado de sintaxis
Plug 'sheerun/vim-polyglot'
" comentarios
Plug 'scrooloose/nerdcommenter'
" auto pairs
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
" autocompletion
Plug 'Valloric/YouCompleteMe'
call plug#end()
" end plugins

set nocompatible
filetype plugin indent on

" General
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
set diffopt+=vertical  " Always use vertical diffs
colorscheme material
""colorscheme minimalist
""colorscheme quantum
""let g:quantum_italics=1
let g:material_theme_style = 'dark' "| 'palenight' | 'default'
let g:material_terminal_italics = 1

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
set wrap
set scrolloff=5
set mouse=a
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

"" Advanced
set ruler	" Show row and column ruler information
set autoread
" Make sure you use single quotes
set noswapfile
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" Open new splits to right and bottom
set splitbelow
set splitright

"" navergar entre paneles
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""avoid vim backups
set nowritebackup
set noswapfile
set nobackup


" mappings """"""""""""""""""""""""""
nnoremap <C-s> :w <CR>
let g:mapleader = ' '  " Definir espacio como la tecla líder

nnoremap <leader>s :w<CR>  " Guardar con <líder> + s

nnoremap <leader>e :e $MYVIMRC<CR>  " Abrir el archivo init.vim con <líder> + e
nnoremap <CR> :noh<CR><CR> " tourn searh highlighting off

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
nnoremap <leader>l :bnext<CR>

" Moverse al buffer anterior con <líder> + j
nnoremap <leader>j :bprevious<CR>

" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>

" Navegación entre ventanas
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Aireline theme
let g:airline_theme='minimalist'
let g:powerline_pycmd="py3"

let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo

" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1

set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn


" prettier
let g:prettier#autoformat = 1
autocmd BufWritePre *.jsx,*.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

" ""'' ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
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

" nerdtree
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
let NERDTreeShowHidden=1

" Abrir/cerrar NERDTree con F2
map <C-b> :NERDTreeToggle<CR>

" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

"ctrlp"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "exclude folders in gitIgnore
let g:ctrlp_show_hidden = 1 

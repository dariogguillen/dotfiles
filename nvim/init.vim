scriptencoding utf-8

"""""""""""""""""""""""""""
""""" Plugins folder """"""
"""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
" Themes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'kaicataldo/material.vim'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" javascript
Plug 'othree/yajs.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'neoclide/vim-jsx-improve'
Plug 'othree/es.next.syntax.vim'
Plug 'elzr/vim-json'
Plug 'w0rp/ale'
Plug 'Galooshi/vim-import-js'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
Plug 'mhartington/deoplete-typescript'

" node
Plug 'moll/vim-node'
Plug 'mmalecki/vim-node.js'

" HTML CSS
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'valloric/MatchTagAlways'
Plug 'Raimondi/delimitMate'
Plug 'lilydjwg/colorizer'

" graphql
Plug 'jparise/vim-graphql'

" editor config
Plug 'editorconfig/editorconfig-vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" identacion
Plug 'Yggdroot/indentLine'

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" ack.vim
Plug 'mileszs/ack.vim'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'

"navigation between nvim and tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'

" icons
Plug 'ryanoasis/vim-webdevicons'

call plug#end()
" end plugins

""""""""""""""""""""""""
"""""" GENERAL """""""""
""""""""""""""""""""""""
set number
set relativenumber
syntax enable
set mouse=r
set wrap
set linebreak
set showbreak=+++
set showmatch
set scrolloff=3
set diffopt+=vertical
set hlsearch
set smartcase
set ignorecase
set incsearch
set cursorline
" Indentación a 2 espacios
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s
set hidden  " Permitir cambiar de buffers sin tener que guardarlos
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español
" Open new splits to right and bottom
set splitbelow
set splitright
hi clear SignColumn
""avoid vim backups
set nowritebackup
set noswapfile
set nobackup

"""" THEME """""""
set termguicolors
" colorscheme hybrid
" colorscheme angr
" colorscheme apprentice
colorscheme gruvbox

let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python3"

"""""""""""""""""""
"""" MAP KEYS """""
"""""""""""""""""""
" Escape with fj
inoremap fj <esc>
"change between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
let g:mapleader = ' '  " Definir espacio como la tecla líder
nnoremap <leader>e :e $MYVIMRC<CR>  " Abrir el archivo init.vim con <líder> + e
nnoremap <leader>s :w<CR>  " Guardar con <líder> + s
nnoremap <C-s> :wa<CR>  " Guardar todo
nnoremap <leader>so :so ~/.config/nvim/init.vim <CR> " recargar configuracion
nnoremap <leader>pi :PlugInstall<CR> " install plugins
nnoremap <leader>pc :PlugClean<CR> " clean plugins
nnoremap <leader>pu :PlugUpdate<CR> " update plugins
nnoremap <leader>pr :PlugUpgrade<CR> " upgrade plug
nnoremap <ESC> :noh<CR> " tourn searh highlighting off
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
" nnoremap <leader>q :bdelete<CR>
nnoremap <leader>q :bp<cr>:bd #<cr>
" arrow keys resize panes
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

"""""""""""""""""""
"""" PLUGINS """"""
"""""""""""""""""""

""" Aireline """"""
let g:airline_theme='gruvbox'
let g:powerline_pycmd="py3"
let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"""" NERDtree
map <leader>n :NERDTreeToggle<CR>
map <leader>b :NERDTreeFocus<CR>
map <leader>f :NERDTreeFind<CR>
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

""" javascript
let g:used_javascript_libs = 'underscore,ramda,vue,d3,react'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

""" emmet
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \      'extends' : 'jsx',
  \  },
  \}

""" w0rp/ale
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint', 'prettier'],
\   'javascript.jsx': ['eslitn', 'prettier'],
\   'vue': ['eslint', 'prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint', 'prettier'],
\   'javascript.jsx': ['eslitn', 'prettier'],
\   'vue': ['eslint', 'prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\}

""" prettier
let g:prettier#autoformat = 1
autocmd BufWritePre *.jsx,*.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

""" deoplete tern
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#enable_camel_case = 1
let g:deoplete#max_menu_width = 0
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""" indentline
let g:indentLine_enable=1
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']

""" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden = 1

""" ack.vim
nnoremap \ :Ack<SPACE>
if executable('rg')
    let g:ackprg = 'rg -S --no-heading --vimgrep'
elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

""" import js
nnoremap <leader>j :ImportJSWord<CR>
nnoremap <leader>i :ImportJSFix<CR>
nnoremap <leader>g :ImportJSGoto<CR>

"" closetag
let g:closetag_filenames = '*.html,*.jsx,*.js'
let g:closetag_filetypes = 'html,jsx,js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx'
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

"" MatchTagAlways
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'javascript.jsx' : 1,
  \ }

""" Raimondi/delimitMate
let delimitMate_matchpairs = "(:),[:],{:}"

""tmuxline
let g:tmuxline_preset = 'tmux'

"""" gitgutter
let g:airline#extensions#hunks#non_zero_only = 1

""" gutentags file
let g:gutentags_cache_dir="/media/data/.tags"

scriptencoding utf-8

""Plugins folder
call plug#begin('~/.local/share/nvim/plugged')
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
"" editor config
Plug 'editorconfig/editorconfig-vim'
" File fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" AMAZING plugin for searching text inside project
Plug 'mhinz/vim-grepper'
""CtrlP
Plug 'ctrlpvim/ctrlp.vim'
" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
" To make tsuguyomi work
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Async intellisense for typescript (as well as error highlighting
Plug 'Quramy/tsuquyomi'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'sbdchd/neoformat', {'on': 'ToggleNeoformat'}
Plug 'skywind3000/asyncrun.vim'
"html
Plug 'alvan/vim-closetag'
Plug 'valloric/MatchTagAlways'
"emmet
Plug 'mattn/emmet-vim' 
" identacion
Plug 'Yggdroot/indentLine'
" resaltado de sintaxis
Plug 'sheerun/vim-polyglot'
" autocomplete
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" Nerd 
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
" autoclosing brackets
Plug 'Raimondi/delimitMate'
"navigation between nvim and tmux
Plug 'christoomey/vim-tmux-navigator'
" auto pairs
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
" icons
Plug 'ryanoasis/vim-devicons'
"" import js
Plug 'Galooshi/vim-import-js'
" Tmuxline
Plug 'edkolev/tmuxline.vim'
" For testing integration
Plug 'janko-m/vim-test'
" For integrating tmux with vim (for janko-m/vim-test)
Plug 'benmills/vimux'
" Highlights new/mofified/deleted lines in the "gutter"
Plug 'mhinz/vim-signify'
Plug 'farmergreg/vim-lastplace'
call plug#end()
" end plugins

" General
set nocompatible
filetype plugin indent on
set number	" Show line numbers
set relativenumber
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set spelllang=en,es
"set background=dark
set termguicolors
set autowrite
set colorcolumn=100  " Set & show limit column
set scrolloff=3  " Display at least 3 lines around you cursor
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
set mouse=r
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
set undolevels=100	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
" Open new splits to right and bottom
set splitbelow
set splitright
hi clear SignColumn
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
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
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
" Mostrar mejor mensajes de error
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" javascript
let g:javascript_plugin_jsdoc = 1
let g:used_javascript_libs = 'lodash,react'
" No mostrar en ciertos tipos de buffers y archivos
let g:identLine_enable=1
let g:identLine_char="⟩"
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
"ctrlp"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "exclude folders in gitIgnore
let g:ctrlp_show_hidden = 1 
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
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
"let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"" import js
nnoremap <leader>j :ImportJSWord<CR>
nnoremap <leader>i :ImportJSFix<CR>
nnoremap <leader>g :ImportJSGoto<CR>
"" closetag
let g:closetag_filenames = '*.html,*.jsx,*.js'
let g:closetag_xhtml_filenames = '*.html,*.jsx,*.js'
let g:closetag_filetypes = 'html,jsx,js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx'
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
let g:vim_jsx_pretty_colorful_config = 1 " default 0
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"" MatchTagAlways
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'javascript.jsx' : 1,
  \ }
""""""" Raimondi/delimitMate """""""
let delimitMate_matchpairs = "(:),[:],{:}"
""""""" Quramy/tsuquyomi """""""
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_disable_quickfix = 1
""""""" edkolev/tmuxline """""""
" For tmuxline + vim-airline integration
let g:airline#extensions#tmuxline#enabled = 1
" Start tmuxline even without vim running
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
" To make it nice
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}
""""""" janko-m/vim-test """""""
let test#strategy = "vimux"
let g:test#javascript#jest#file_pattern = '.*\.spec\.js'
""""""" mhinz/vim-signify """""""
let g:signify_vcs_list = [ 'git' ]

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
"" lastplace
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"

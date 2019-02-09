scriptencoding utf-8

"""""""""""""""""""""""""""
""""" Plugins folder """"""
"""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
" Themes
Plug 'rafi/awesome-vim-colorschemes'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'
Plug 'vim-syntastic/syntastic'
Plug 'moll/vim-node'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'Galooshi/vim-import-js'

" HTML CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
Plug 'valloric/MatchTagAlways'
Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate'
Plug 'lilydjwg/colorizer'

" editor config
Plug 'editorconfig/editorconfig-vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" identacion
Plug 'Yggdroot/indentLine'

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'ternjs/tern_for_vim'

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
Plug 'ryanoasis/vim-devicons'

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
set textwidth=100
set showmatch
set scrolloff=3
set diffopt+=vertical
set foldmethod=syntax
set foldcolumn=1
let javascript_fold=1
set foldlevelstart=99
set hlsearch
set smartcase
set ignorecase
set incsearch
set cursorline
set colorcolumn=100
set showbreak=100
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
set termguicolors

"""" THEME """""""
set background=dark
colorscheme hybrid

let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python3"

"""""""""""""""""""
"""" MAP KEYS """""
"""""""""""""""""""

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
nnoremap <leader>l :bnext<CR>
" Moverse al buffer anterior con <líder> + j
nnoremap <leader>h :bprevious<CR>
" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>
" arrow keys resize panes
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

"""""""""""""""""""
"""" PLUGINS """"""
"""""""""""""""""""

""" Aireline """""" 
let g:airline_theme='hybrid'
let g:powerline_pycmd="py3"
let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#non_zero_only = 1

"""" NERDtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
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

""" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

""" syntastic
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

""" javascript
let g:used_javascript_libs = 'underscore,ramda,vue,d3,react'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

""" emmet
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \      'extends' : 'jsx',
  \  },
  \}

""" w0rp/ale
nmap <leader>d <Plug>(ale_fix)
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'vue': ['eslint'],
\    'scss': ['prettier']
\}
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

""" youcompleteme
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1

""" indentline
let g:indentLine_enable=1
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']

""" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden = 1 

""" fzf
nnoremap <leader>f :Ag<CR>

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

""" Quramy/tsuquyomi
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_disable_quickfix = 1

""tmuxline
let g:tmuxline_preset = 'tmux'

"""" gitgutter
let g:airline#extensions#hunks#non_zero_only = 1

""" gutentags file
let g:gutentags_cache_dir="/media/data/.tags"

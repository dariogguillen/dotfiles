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
Plug 'ryanoasis/vim-devicons'

" javascript
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': [
  \ 'javascript',
  \ 'typescript',
  \ 'css',
  \ 'less',
  \ 'scss',
  \ 'json',
  \ 'graphql',
  \ 'markdown',
  \ 'vue',
  \ 'yaml',
  \ 'html'
  \ ] }

" HTML CSS
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
Plug 'valloric/MatchTagAlways'
Plug 'Raimondi/delimitMate'
Plug 'lilydjwg/colorizer'

" graphql
Plug 'jparise/vim-graphql'

" scala
Plug 'derekwyatt/vim-scala'
" editor config
Plug 'editorconfig/editorconfig-vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" identacion
Plug 'Yggdroot/indentLine'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" navigation between nvim and tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

" others
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ntpeters/vim-better-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/denite.nvim'
call plug#end()
" end plugins

""""""""""""""""""""""""
"""""" SETTINGS """"""""
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
set autoread                        " auto reload file if changed externally
set nobackup                        " no ~backup files
set noswapfile                      " no swap files
set autowrite                       " save files automatically in most cases
set list                            " show hidden characters
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:%,eol:¬
set sidescrolloff=5                 " show next 5 columns while side-scrolling
set splitbelow                      " more natural horizontal split
set splitright                      " more natural vertical split
set clipboard=unnamedplus           " yanks puts it on clipboard
set colorcolumn=100                 " show a right margin column
set lazyredraw                      " wait to redraw
set pumheight=10                    " completion window max size
set updatetime=500                  " millis before cursorhold event, useful for tern
set undofile
set undodir=~/.config/nvim/undodir

" hide everywhere
set wildignore+=*.o,.git,.svn,node_modules,vendor,bower_components,__jsdocs,.nyc_output,coverage,target

au FileType python set noet
au FileType java set sw=4 ts=4 sts=4

au BufRead,BufNewFile doc.go setlocal spell
au BufRead,BufNewFile .eslintrc setf json
au BufRead,BufNewFile .prettierrc setf json
au BufRead,BufNewFile .babelrc setf json
au BufRead,BufNewFile .tern-project setf json
au BufRead,BufNewFile *.jsdoc setf javascript.jsx
au FileType gitcommit setlocal spell

" open files where last edits took place
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

"""" THEME """""""
set termguicolors
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid_reverse

let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python3"

"""""""""""""""""""
"""" MAP KEYS """""
"""""""""""""""""""
" Escape with fj
inoremap jk <esc>
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

autocmd FileType json syntax match Comment +\/\/.\+$+

"""""""""""""""""""
"""" PLUGINS """"""
"""""""""""""""""""

""" Aireline """"""
let g:airline_minimalist_showmod = 1
let g:airline_theme='minimalist'
let g:powerline_pycmd="py3"
let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"""" NERDtree
map <leader>n :NERDTreeToggle<CR>
map <leader>b :NERDTreeFocus<CR>
map <leader>f :NERDTreeFind<CR>
let g:NERDTreeDirArrows = 1
" let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeRespectWildIgnore = 1
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

""" prettier
let g:prettier#autoformat = 1
autocmd BufWritePre *.jsx,*.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

""" indentline
let g:indentLine_faster = 1
let g:indentLine_color_term = 236
let g:indentLine_noConcealCursor = "nc"
let g:indentLine_concealcursor=""
let g:indentLine_char ='┆'

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
let g:gitgutter_map_keys = 0
let g:airline#extensions#hunks#non_zero_only = 1

""" gutentags file
let g:gutentags_cache_dir="~/.config/nvim/tags"

" === Denite setup ==="
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': '❯ ',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}

function! s:profile(opts) abort
  for fname in keys(a:opts)
    for dopt in keys(a:opts[fname])
      call denite#custom#option(fname, dopt, a:opts[fname][dopt])
    endfor
  endfor
endfunction

call denite#custom#var(
  \ 'file/rec',
  \'command',
  \ ['rg', '--hidden', '--files', '--glob', '!.git', '--glob', '']
  \ )

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call s:profile(s:denite_options)

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

nnoremap <C-p> :Denite -start-filter file/rec<CR>
nnoremap \ :Denite -start-filter grep:::!<CR>

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-syntax',
  \ 'coc-python',
  \ 'coc-yaml',
  \ 'coc-vimlsp',
  \ 'coc-git',
  \ 'coc-docker',
  \ 'coc-marketplace'
  \ ]

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+

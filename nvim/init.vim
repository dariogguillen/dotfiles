scriptencoding utf-8

"""""""""""""""""""""""""""
""""""Plugins folder"""""""
"""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
""""" Themes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

""""" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""""" javascript
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
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

""""" HTML CSS
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
Plug 'valloric/MatchTagAlways'
Plug 'Raimondi/delimitMate'
Plug 'lilydjwg/colorizer'

""""" graphql
Plug 'jparise/vim-graphql'

""""" scala
Plug 'derekwyatt/vim-scala'

""""" editor config
Plug 'editorconfig/editorconfig-vim'

""""" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

""""" identacion
Plug 'Yggdroot/indentLine'

""""" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

""""" others
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ntpeters/vim-better-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/denite.nvim'
call plug#end()

""""""""""""""""""""""""
"""""""SETTINGS"""""""""
""""""""""""""""""""""""
set relativenumber
syntax enable
set mouse=r
set wrap
set linebreak
set breakindent
set showbreak=+
set showmatch
set diffopt+=vertical
set hlsearch
set smartcase
set ignorecase
set incsearch
set cursorline
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set hidden
set noshowmode
set spelllang=en
set splitbelow
set splitright
set signcolumn=yes
hi clear SignColumn
set nowritebackup
set autoread
set nobackup
set noswapfile
set autowrite
set list
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:%,eol:¬
set sidescrolloff=5
set clipboard=unnamedplus
set lazyredraw
set pumheight=10
set updatetime=300
set undofile
set undodir=~/.config/nvim/undodir

" hide everywhere
"set wildignore+=*.o,.git,.svn,node_modules,vendor,bower_components,__jsdocs,.nyc_output,coverage,target

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

""""" THEME
set termguicolors
"colorscheme hybrid_reverse
"colorscheme hybrid
"colorscheme two-firewatch
"colorscheme nord
colorscheme pink-moon

let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python3"

"""""""""""""""""""
"""""MAP KEYS""""""
"""""""""""""""""""
" Escape with fj
inoremap jk <esc>

" change between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
let g:mapleader = ' '
nnoremap <leader>e :e $MYVIMRC<CR>
nnoremap <leader>s :w<CR>
nnoremap <C-s> :wa<CR>
nnoremap <leader>so :so ~/.config/nvim/init.vim <CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pr :PlugUpgrade<CR>
nnoremap <ESC> :noh<CR>
vnoremap <leader>y "+y
nnoremap <leader>y "+y
vnoremap <leader>d "+d
nnoremap <leader>d "+d
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>q :bp<cr>:bd #<cr>
nnoremap <S-Left> :vertical resize -1<CR>
nnoremap <S-Right> :vertical resize +1<CR>
nnoremap <S-Up> :resize -1<CR>
nnoremap <S-Down> :resize +1<CR>

autocmd FileType json syntax match Comment +\/\/.\+$+

"""""""""""""""""""
"""""PLUGINS"""""""
"""""""""""""""""""

""""" Aireline
let g:airline_minimalist_showmod = 1
" let g:airline_theme='minimalist'
let g:airline_theme='hybrid'
let g:powerline_pycmd="py3"
let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1

""""" NERDtree
map <leader>n :NERDTreeToggle<CR>
map <leader>b :NERDTreeFocus<CR>
map <leader>f :NERDTreeFind<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeRespectWildIgnore = 1
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

""""" javascript
let g:used_javascript_libs = 'underscore,ramda,vue,d3,react'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

""""" emmet
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \      'extends' : 'jsx',
  \  },
  \}

""""" prettier
let g:prettier#autoformat = 1
autocmd BufWritePre *.jsx,*.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

""""" indentline
let g:indentLine_faster = 1
let g:indentLine_color_term = 236
let g:indentLine_noConcealCursor = "nc"
let g:indentLine_concealcursor=""
let g:indentLine_char ='┆'

""""" closetag
let g:closetag_filenames = '*.html,*.jsx,*.js'
let g:closetag_filetypes = 'html,jsx,js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx'
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

""""" MatchTagAlways
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'javascript.jsx' : 1,
  \ }

""""" Raimondi/delimitMate
let delimitMate_matchpairs = "(:),[:],{:}"

"""""" gitgutter
let g:gitgutter_map_keys = 0
let g:airline#extensions#hunks#non_zero_only = 1

""""" gutentags file
let g:gutentags_cache_dir="~/.config/nvim/tags"

""""" Denite setup
let s:denite_options = {'default' : {
\ 'prompt': '❯ ',
\ 'split': 'floating',
\ 'auto_resize': 1,
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

""""" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call s:profile(s:denite_options)

""""" Define mappings
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
nnoremap <leader><C-p> :Denite buffer<CR>
nnoremap \ :Denite -start-filter grep:::!<CR>

""""" Coc.nvim
let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-syntax',
  \ 'coc-python',
  \ 'coc-yaml',
  \ 'coc-docker',
  \ 'coc-marketplace',
  \ 'coc-metals'
  \ ]

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gt <Plug>(coc-type-definition)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

""""" Configuration for vim-scala
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+


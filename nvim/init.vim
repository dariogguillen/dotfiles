scriptencoding utf-8

"""""""""""""""""""""""""""
""""""Plugins folder"""""""
"""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'wojciechkepka/vim-github-dark'
Plug 'ryanoasis/vim-devicons'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
Plug 'valloric/MatchTagAlways'
Plug 'Raimondi/delimitMate'
Plug 'lilydjwg/colorizer'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

""""""""""""""""""""""""
"""""""SETTINGS"""""""""
""""""""""""""""""""""""
set nu
set relativenumber
syntax enable
set mouse=a
set nowrap
set linebreak
set breakindent
set showbreak=>>>
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

au! BufWritePost $MYVIMRC source %

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
" let g:nord_uniform_diff_background = 1
" colorscheme nord
colorscheme hybrid
" hi Search guifg=blue

let g:loaded_perl_provider=0
let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python3"

"""""""""""""""""""
"""""MAP KEYS""""""
"""""""""""""""""""
" Escape with fj
inoremap jk <esc>
inoremap kj <esc>

" change between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
let g:mapleader = ' '
nnoremap <leader>e :e $MYVIMRC<CR>
nnoremap <leader>s :w<CR>
nnoremap <C-s> :wa<CR>
nnoremap <C-x> :SSave! <bar> :xa<CR>
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
vnoremap < <gv
vnoremap > >gv

autocmd FileType json syntax match Comment +\/\/.\+$+

"""""""""""""""""""
"""""PLUGINS"""""""
"""""""""""""""""""

""""" Aireline
let g:airline_minimalist_showmod = 1
let g:airline_theme='minimalist'
let g:airline_detect_paste=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#non_zero_only = 1

"""" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

""""" javascript
let g:used_javascript_libs = 'underscore,ramda,vue,d3,react'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

""""" prettier
let g:prettier#autoformat = 1
autocmd BufWritePre *.jsx,*.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

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

""""" Coc.nvim
let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-syntax',
  \ 'coc-metals',
  \ 'coc-explorer',
  \ 'coc-vimlsp',
  \ 'coc-java',
  \ 'coc-rust-analyzer'
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

nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

au BufRead,BufNewFile *.sbt,*.sc set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+

"" coc-explorer
nmap <leader>b :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" FZF
map <C-p> :GFiles<CR>
map <leader><C-p> :Buffers<CR>
nnoremap \ :Rg! 
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

"""" rust
let g:rustfmt_autosave=1

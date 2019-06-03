set nocompatible			  " be iMproved, required
filetype off				  " required
set encoding=utf-8
filetype plugin indent on
syntax on

"""""""""
" Plugins
"""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'
Plugin 'tomtom/tcomment_vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-sensible'
Plugin 'ErichDonGubler/vim-sublime-monokai'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-repeat'
Plugin 'mileszs/ack.vim'
" All of your Plugins must be added before the following line
call vundle#end()			 " required

call plug#begin()
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'copy/deoplete-ocaml'
Plug 'w0rp/ale'
call plug#end()

execute pathogen#infect()

""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""
" ale checkers
let g:ale_fixers = { 'javascript': ['eslint'], 'ocaml': ['merlin'], 'python': ['pylint', 'flake8'] }
" let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'never'

" lightline
let g:lightline = {
	\	'colorscheme': 'onedark',
	\ 'active': {
	\		'left': [ [ 'mode', 'paste' ],
	\							[ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
	\		'right': [ [ 'lineinfo' ],
	\							 [ 'percent' ],
	\							 [ 'fileformat', 'fileencoding', 'filetype' ],
	\							 [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
	\	},
	\	'component_function': {
	\		'gitbranch': 'fugitive#head'
	\	},
	\	'component_expand': {
	\		'linter_checking': 'lightline#ale#checking',
	\		'linter_warnings': 'lightline#ale#warnings',
	\		'linter_errors': 'lightline#ale#errors',
	\		'linter_ok': 'lightline#ale#ok',
	\	},
	\	'component_type': {
	\		'linter_checking': 'left',
	\		'linter_warnings': 'warning',
	\		'linter_errors': 'error',
	\		'linter_ok': 'left',
	\ },
	\}
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
  \}

let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set noshowmode

" Deoplete enabling
let g:deoplete#enable_at_startup = 1
let g:merlin_completion_with_doc = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around', 'member', 'tag']

" Ag with ack
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" Tagbar
nmap <F8> :TagbarToggle<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""
" Options
"""""""""
" Buffers
set hidden
set confirm

" Interface
set number
set wrap
set belloff=all
set nottimeout ttimeout ttimeoutlen=200
" let g:solarized_termcolors=256
colorscheme onedark
set bg=dark
" let g:monokai_term_italic=1
set termguicolors
set guifont=SauceCodePro\ Nerd\ Font

" Searching
nnoremap <F3> :set hlsearch!<CR>
set ignorecase
set smartcase
set incsearch

" Status
set laststatus=2

" Editing
set backspace=indent,eol,start
set smartindent
set nopaste
set pastetoggle=<F11>

" Folding
set nofoldenable
" set foldmethod=indent
" set foldlevel=99

" Formatting
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=80
set formatoptions=cq
set wrapmargin=0
set noexpandtab

""""""""""
" Mappings
""""""""""
" easier exiting
inoremap jk <esc>
nmap <C-H> <Plug>IMAP_JumpForward
imap <C-H> <Plug>IMAP_JumpForward
" better help
nnoremap <F1> :help <C-R><C-W><CR>

" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" split navigation
nnoremap <C-J> <C-W><j>
nnoremap <C-K> <C-W><k>
nnoremap <C-L> <C-W><l>
nnoremap <C-H> <C-W><h>
" reformatting paragraphs
nnoremap Q gqip
" moving around lines
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP
" uppercasing
inoremap <leader><c-u> <esc>viwUea
nnoremap <leader><c-u> viwU
" quick vimrc opening and sourcing
nnoremap <leader>ev :vsplit ~/.vimrc<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

""""""""""""""""""""
" Abbreviations
""""""""""""""""""""
iabbrev eqn equation
iabbrev defn definition
iabbrev thm theorem
iabbrev rmk remark
iabbrev propn proposition

""""""""""""""""""""""""""
" File-Specific Settings
""""""""""""""""""""""""""
" python
au FileType python setlocal
	\	tabstop=4
  \ softtabstop=4
  \ shiftwidth=4
  \ smarttab
  \ expandtab
  \ fileformat=unix
  \ fo=tcq
  \ textwidth=79
  \ colorcolumn=80

let python_highlight_all=1

" JS/HTML
au FileType js,html,css setlocal
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2

" ocaml
au FileType ocaml
  \ compiler ocaml | source /Users/serinahu/.opam/default/share/ocp-indent/vim/indent/ocaml.vim

" markdown
au FileType pandoc,markdown setlocal
  \ textwidth=79
  \ wm=0
  \ nonumber
  \ spell
  \ formatprg=par | call deoplete#custom#buffer_option('auto_complete', v:false)

" latex
au FileType tex setlocal spell | call deoplete#custom#buffer_option('auto_complete', v:false)

" C
au FileType c setlocal
  \ tabstop=4
  \ softtabstop=4
  \ shiftwidth=4
  \ textwidth=120
  \ expandtab
  \ cindent
  \ fileformat=unix
  \ fo=tcq

"""""""""""""""""""""
" Opam Config
"""""""""""""""""""""
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 5c1fa8c69f7e64f7d8cff78973c57f16 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/serinahu/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line

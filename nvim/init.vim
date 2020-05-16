" be iMproved
set nocompatible
set encoding=utf-8
filetype plugin indent on
set clipboard+=unnamedplus

" using Vundle for plugin management
" put Vundle in Neovim folder
set rtp+=~/.local/share/nvim/site/bundle/Vundle.vim
call vundle#begin("~/.local/share/nvim/site/bundle") " required
Plugin 'VundleVim/Vundle.vim' " required

Plugin 'airblade/vim-gitgutter'
Plugin 'dense-analysis/ale'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'majutsushi/tagbar'
Plugin 'maximbaz/lightline-ale'
Plugin 'mileszs/ack.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-latex/vim-latex' " vim-latex through Vundle
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vimwiki/vimwiki'
Plugin 'itchyny/calendar.vim'
call vundle#end()

call plug#begin("~/.local/share/nvim/site/plugged")
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
call plug#end()

""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""
" PDF compilation
let g:Tex_DefaultTargetFormat = 'pdf'
" deoplete
let g:deoplete#enable_at_startup = 1
" ale checkers
let g:ale_fixers = { 'c': ['clang', 'gcc'], 'cpp': ['clang', 'gcc'] }
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

" ripgrep
let g:ackprg = 'rg --vimgrep --no-heading'

" vim-latex
let g:Tex_Env_Theorem = "\\begin{Theorem}{<++>}{}\<CR><++>\<CR>\\end{Theorem}<++>"
let g:Tex_Env_Lemma = "\\begin{Lemma}{<++>}{}\<CR><++>\<CR>\\end{Lemma}<++>"
let g:Tex_Env_Example = "\\begin{Example}{<++>}{}\<CR><++>\<CR>\\end{Example}<++>"
let g:Tex_Env_Definition = "\\begin{Definition}{<++>}{}\<CR><++>\<CR>\\end{Definition}<++>"
let g:Tex_Env_Corollary = "\\begin{Corollary}{<++>}{}\<CR><++>\<CR>\\end{Corollary}<++>"
let g:Tex_Env_Proposition = "\\begin{Proposition}{<++>}{}\<CR><++>\<CR>\\end{Proposition}<++>"
let g:Tex_Env_Note = "\\begin{Note}{}{}\<CR><++>\<CR>\\end{Note}<++>"
let g:Tex_Env_Remark = "\\begin{Remark}{}{}\<CR><++>\<CR>\\end{Remark}<++>"
let g:Tex_Env_Claim = "\\begin{Claim}{}{}\<CR><++>\<CR>\\end{Claim}<++>"
let g:Tex_Env_Problem = "\\begin{Problem}{<++>}{}\<CR><++>\<CR>\\end{Problem}<++>"

"""""""""
" Options
"""""""""

" tabline
set showtabline=2 " Show tabline
set guioptions-=e " No GUI tabline

" Buffers
set hidden
set confirm

" Interface
set noshowmode
set number
set wrap
set belloff=all
set nottimeout ttimeout ttimeoutlen=200
colorscheme onedark
set bg=dark
set termguicolors
" set guifont=SauceCodePro\ Nerd\ Font

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
" set textwidth=80
set formatoptions=cqj
set wrapmargin=0
set noexpandtab

""""""""""
" Mappings
""""""""""
" easier exiting
inoremap jk <esc>
" make space more useful
nnoremap <Space> za

" improved w and q
command WW w !SUDO_ASKPASS=/usr/lib/ssh/ssh-askpass sudo -A tee % > /dev/null

" tex mappings w/dvorak
nmap <C-H> <Plug>IMAP_JumpForward
imap <C-H> <Plug>IMAP_JumpForward

" better help
nnoremap <F1> :help <C-R><C-W><CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_vimwiki = {
      \   'ctagstype':'vimwiki'
      \ , 'kinds':['h:header']
      \ , 'sro':'&&&'
      \ , 'kind2scope':{'h':'header'}
      \ , 'sort':0
      \ , 'ctagsbin':'~/.local/share/nvim/vwtags.py'
      \ , 'ctagsargs': 'default'
      \ }

""""""""""""""""""""
" Abbreviations
""""""""""""""""""""
iabbrev eqn Equation
iabbrev defn Definition
iabbrev thm Theorem
iabbrev rmk Remark
iabbrev propn Proposition

""""""""""""""""""""""""""
" File-Specific Settings
""""""""""""""""""""""""""

" latex
au FileType tex setlocal spell | call deoplete#custom#buffer_option('auto_complete', v:false)

" python
au FileType python setlocal
	\	tabstop=4
  \ softtabstop=4
  \ shiftwidth=4
  \ smarttab
  \ expandtab
  \ fileformat=unix
  \ fo=tcq
  \ textwidth=119
  \ colorcolumn=120

let python_highlight_all=1

" markdown
au FileType pandoc,markdown setlocal
  \ textwidth=79
  \ wm=0
  \ nonumber
  \ spell
  \ formatprg=par | call deoplete#custom#var('omni', 'ipnut_patterns', {'pandoc': '@'})

" C
au FileType c,cpp setlocal
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2
  \ textwidth=120
  \ expandtab
  \ cindent
	\ cinoptions=l1
  \ fileformat=unix
  \ fo=tcq

" copy and paste
" function! ClipboardYank()
" 	call system('xclip -i -selection clipboard', @@)
" endfunction
" 
" function! ClipboardPaste()
" 	let @@ = system('xclip -o -selection clipboard')
" endfunction
" 
" vnoremap <silent> y y:call ClipboardYank()<CR>
" vnoremap <silent> d d:call ClipboardYank()<CR>
" nnoremap <silent> p :call ClipboardPaste()<CR>p

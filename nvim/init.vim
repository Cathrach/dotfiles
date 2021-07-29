packadd packer.nvim
lua require('plugins')

" Appearances
set termguicolors
colorscheme sonokai
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
highlight = {
enable = true,              -- false will disable the whole extension
},
}
EOF

"Lightline
let g:lightline = {
            \ 'colorscheme': 'sonokai',
            \ 'active': {
                \ 'left': [ ['mode', 'paste' ],
                \ [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
                \ 'right': [ [ 'lineinfo' ],
                \ [ 'percent' ],
                \ [ 'fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'component_function': {
                    \ 'gitbranch': 'fugitive#head'
                    \ },
                    \}
let g:lightline.separator = {
            \   'left': '', 'right': ''
            \}
let g:lightline.subseparator = {
            \   'left': '', 'right': ''
            \}

" Better mapping
inoremap jk <ESC>
nnoremap <SPACE> za

" tabs
set showtabline=2
set guioptions-=e

" buffers
set hidden
set confirm

" intefrace
set noshowmode
set number
set relativenumber
set signcolumn=number
set wrap

" searching
nnoremap <F3> :set hlsearch!<CR>
set ignorecase
set smartcase
set incsearch
let g:fzf_tags_command = 'uctags -R'
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, {'source': 'rg --files --hidden --glob "!{.cache/*,build/*,.git/*}"'}, <bang>0)
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
let g:rg_derive_root='true'
let g:tagbar_ctags_bin='/usr/local/bin/uctags'
nmap <F8> :TagbarToggle<CR>
let g:gutentags_ctags_executable='uctags'

" indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent

" coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
nmap <leader>f <Plug>(coc-format)
nmap <leader>r <Plug>(coc-rename)
nmap <C-]> <Plug>(coc-definition)
nmap <C-[> <Plug>(coc-declaration)

" nvim-tree
let g:nvim_tree_ignore = [ '.git' ]
let g:nvim_tree_gitignore = 1
nnoremap <C-n> :NvimTreeToggle<CR>

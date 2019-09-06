" Neovim Plugins https://github.com/neovim/neovim/wiki/Related-projects#plugins
" vim-plug Plugin Manager - https://github.com/junegunn/vim-plug#usage
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - For Vim: ~.vim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" - Reload .vimrc and :PlugInstall to install plugins.
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" enhancemets
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'roxma/nvim-completion-manager'
Plug 'Chiel92/vim-autoformat'

" git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter', {'type': 'opt'}

" python
Plug 'zchee/deoplete-jedi'
Plug 'nvie/vim-flake8'
Plug 'sbdchd/neoformat'
Plug 'mindriot101/vim-yapf'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" haskell
Plug 'neovimhaskell/haskell-vim'

" rust
Plug 'mustache/vim-mustache-handlebars'
Plug 'sebastianmarkow/deoplete-rust'

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" Javascript
Plug 'maksimr/vim-jsbeautify'

" Typescript
Plug 'leafgarland/typescript-vim'

" Ethereum Solidity
Plug 'tomlion/vim-solidity'

" Initialize plugin system
call plug#end()

" Python Tools
let g:python3_host_prog = "/usr/bin/python3.6"
" enable all Python syntax highlighting features
let python_highlight_all = 1


" NerdTree Tools
autocmd vimenter * NERDTree
" NerdTree Toggle
map <C-n> :NERDTreeToggle<CR>
:imap <C-j> <Esc>
" enable line numbers
let NERDTreeShowLineNumbers=1

" Typscript Tools
set ff=unix
" Fullstack Python Vimrc File
" https://www.fullstackpython.com/vim.html
" enable syntax highlighting
syntax enable

" set max line width to 79 characters
:set colorcolumn=80
:highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" Use deoplete.
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Enable JsBeautify
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Vim-Airline
" List of themes here:
" $HOME/.local/share/nvim/plugged/vim-airline-themes/doc/airline-themes.txt
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_default'
" let g:airline_theme='ubaryd'
" let g:airline_solarized_bg='dark'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" Set Spell
:nmap <F8> :setlocal spell spelllang=en_us<CR>
:nmap <F9> :set nospell<CR>
:nmap <F7> :echo 'Hi Heath'<CR>

" Haskell Tools
let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2

" Rust Tools
" https://github.com/sebastianmarkow/deoplete-rust
let g:deoplete#sources#rust#racer_binary='/path/to/racer'
let g:deoplete#sources#rust#rust_source_path='/path/to/rust/src'

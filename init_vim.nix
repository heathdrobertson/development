{pkgs}:
{
  config = ''
    " Neovim Plugins https://github.com/neovim/neovim/wiki/Related-projects#plugins
    " vim-plug Plugin Manager - https://github.com/junegunn/vim-plug#usage
    " Specify a directory for plugins
    " - For Neovim: ~/.local/share/nvim/plugged
    " - For Vim: ~.vim/plugged
    " - Avoid using standard Vim directory names like 'plugin'
    " - Reload .vimrc and :PlugInstall to install plugins.
    " call plug#begin('~/.local/share/nvim/plugged')
    call plug#begin('~/.config/nvim/autoload/plug.vim')

    " Make sure you use single quotes

    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    Plug 'junegunn/vim-easy-align'

    " enhancemets
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'roxma/nvim-completion-manager'
    Plug 'Chiel92/vim-autoformat'

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter', {'type': 'opt'}
    autocmd Filetype gitcommit setlocal spell textwidth=72

    " Deoplete
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'wokalski/autocomplete-flow'
    " For func argument completion
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    Plug 'zchee/deoplete-jedi'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'davidhalter/jedi-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'sebastianmarkow/deoplete-rust'

    " python
    Plug 'nvie/vim-flake8'
    Plug 'sbdchd/neoformat'
    Plug 'mindriot101/vim-yapf'

    augroup fmt
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
    augroup END

    " HTML
    Plug 'townk/vim-autoclose'
    Plug 'tpope/vim-surround'

    " Javascript
    Plug 'maksimr/vim-jsbeautify'

    " Typescript
    Plug 'leafgarland/typescript-vim'

    " Nix Expressions
    Plug 'LnL7/vim-nix'
    
    " Rust
    let g:deoplete#sources#rust#rust_source_path='/nix/store/kx7xw2fhvgf77swzmpmc7israhrkidy9-rustup-1.19.0/bin/rustup'

    " Ethereum Solidity
    Plug 'tomlion/vim-solidity'

    " Initialize plugin system
    call plug#end()

    let g:python3_host_prog="/nix/store/swy0p01xr0wyh907d67hkxr1g0kngcpn-python3-3.7.4/bin/python"


    autocmd vimenter * NERDTree
    " NerdTree Toggle
    map <C-n> :NERDTreeToggle<CR>
    :imap <C-j> <Esc>
    " enable line numbers
    let NERDTreeShowLineNumbers=1

    " neosnippet
    let g:neosnippet#enable_completed_snippet = 1

    " Haskell
    " Disable haskell-vim omnifunc
    let g:haskellmode_completion_ghc = 0
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    let g:ycm_semantic_triggers = {'haskell' : ['.']}
    " Hasekll Show detailed information (type) of symbols.
    let g:necoghc_enable_detailed_browse = 1

    " Typscript
    set ff=unix
    " Fullstack Python Vimrc File
    " https://www.fullstackpython.com/vim.html
    " enable syntax highlighting
    syntax enable

  " Whether to include documentation strings (if found) in the result data.
  let g:deoplete#sources#ternjs#docs = 1

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

    " show the matching part of the pair for [] {} and ()
    set showmatch

    " enable all Python syntax highlighting features
    let python_highlight_all=1

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
    let g:airline#extensions#tabline#enabled=1
    let g:airline_theme='laederon' " 'papercolor'

    if !exists('g:airline_symbols')
      let g:airline_symbols={}
    endif
    let g:airline_symbols.space="\ua0"

    " unicode symbols
    let g:airline_left_sep='»'
    let g:airline_left_sep=''
    let g:airline_right_sep='«'
    let g:airline_right_sep=''
    let g:airline_symbols.crypt='🔒'
    let g:airline_symbols.linenr='☰'
    let g:airline_symbols.linenr='␊'
    let g:airline_symbols.linenr='␤'
    let g:airline_symbols.linenr='¶'
    let g:airline_symbols.maxlinenr=' '
    let g:airline_symbols.maxlinenr='㏑'
    let g:airline_symbols.branch='⎇'
    let g:airline_symbols.paste='ρ'
    let g:airline_symbols.paste='Þ'
    let g:airline_symbols.paste='∥'
    let g:airline_symbols.spell='Ꞩ'
    let g:airline_symbols.notexists='∄'
    let g:airline_symbols.whitespace='Ξ'

    " powerline symbols
    let g:airline_left_sep=''
    let g:airline_left_alt_sep=''
    let g:airline_right_sep=''
    let g:airline_right_alt_sep=''
    let g:airline_symbols.branch=''
    let g:airline_symbols.readonly=''
    let g:airline_symbols.linenr='☰'
    let g:airline_symbols.maxlinenr=''

    " Set Spell
    :nmap <F8> :setlocal spell spelllang=en_us<CR>
    :nmap <F9> :set nospell<CR>
    :nmap <F7> :echo 'Hi Heath'<CR>

    " set Vertical Column color at 80 chars
    set colorcolumn=89

    " show a visual line under the cursor's current line
    highlight Cursor guifg=white guibg=black
    highlight iCursor guifg=white guibg=steelblue
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10
    set cursorline
    :hi CursorLine   cterm=NONE ctermbg=25 guibg=darkblue ctermfg=4 guifg=white  
    :hi CursorColumn cterm=NONE ctermfg=4 ctermbg=25  guibg=darkblue guifg=white
    :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
  '';
}

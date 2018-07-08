" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Set up VUNDLE (ZYD)
set shell=/bin/bash
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	" Add plugins here before call vundle#end()
	Plugin 'Chiel92/vim-autoformat'
	Plugin 'octol/vim-cpp-enhanced-highlight'
	Plugin 'scrooloose/nerdtree'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'Yggdroot/indentLine'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'auto-pairs-gentle'
    Plugin 'chiphogg/vim-prototxt'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'hdima/python-syntax'
    Plugin 'tacahiroy/ctrlp-funky'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-surround'
    " Themes
	Plugin 'dikiaap/minimalist'
    Plugin 'aradunovic/perun.vim'
    Plugin 'danilo-augusto/vim-afterglow'
    Plugin 'hzchirs/vim-material'
    Plugin 'kadekillary/subtle_solo'
    Plugin 'kristijanhusak/vim-hybrid-material'
    Plugin 'nightsense/seagrey'
    Plugin 'tyrannicaltoucan/vim-quantum'
call vundle#end()
filetype plugin indent on
" End setting

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden		    " Hide buffers when they are abandoned
set mouse=a		    " Enable mouse usage (all modes)
set number
set cindent
set autoindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set wrap
set ruler
set laststatus=2
set foldmethod=indent
set colorcolumn=81
set foldlevel=81
set cursorline
set tw=80
set fo=cq
set wm=0

let mapleader=','

map <C-j> :bnext<CR>
map <C-k> :bprev<CR>
nnoremap * *``
noremap <F2> :nohl<CR>

highlight ColorColumn ctermbg=33

let g:enable_bold_font = 1
highlight Comment cterm=italic

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"Airline
let g:airline_powerline_fonts=1
" let g:airline_theme='papercolor'
" let g:airline_theme='hybrid'
let g:airline_theme='luna'
" let g:airline_theme='wombat'
" let g:airline_theme='material'
" let g:airline_theme='minimalist'
" let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = '◀'
" let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
" let g:airline#extensions#default#layout =[
"     \ [ 'a', 'b', 'c' ],
"     \ [ 'x', 'z', 'error', 'warning']
"     \ ]
"End Airline

"NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
nmap <c-l> :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"
let g:NERDTreeWinSize = 40
"End NERDTree

set backspace=indent,eol,start

"cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
"End cpp-enhanced-highlight

" indent line
" let g:indentLine_setColors = 0
let g:indentLine_char = '⋮'
" let g:indentLine_bgcolor_term = 233

" YCM completer
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter='/usr/bin/python2.7'
"let g:ycm_python_binary_path='/usr/bin/python2.7'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comment = 1
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completeion = 1
let g:ycm_key_invoke_completion = '<C-n>'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_always_populate_location_list = 0
let g:ycm_log_level = 'debug'
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"autocmd BufEnter * if &filetype == "" | setlocal ft=cpp | endif

" Vim fomatter
noremap <F3> :Autoformat<CR>
let g:formatterpath = ['/data01/home/zhuyandong/llvm_clang/bin', '/data00/home/zhuyandong/.local/bin/js-beautify']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:formatter_yapf_style = 'pep8'
" let g:autoformat_verbosemode=1

" Python-syntax
let python_highlight_all = 1

" Gitgutter
let g:gitgutter_realtime = 1
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_added = '+'
" highlight GitGutterAdd guifg = '#A3E28B'

" CtrlP & CtrlP-Funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']
let g:ctrlp_match_window = 'top,order:ttb,min:5,max:20,results:20'

" colorscheme minimalist
" colorscheme vim-material
" colorscheme afterglow
" colorscheme seagrey-light
" colorscheme perun
" colorscheme quantum
colorscheme hybrid_material

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set encoding=utf-8

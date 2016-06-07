set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Barra de informacoes
Plugin 'vim-airline/vim-airline'

" Temas da barra de informacoes
Plugin 'vim-airline/vim-airline-themes'

" Code Snippet
Plugin 'msanders/snipmate.vim'

" Verificador de erros PHP
Plugin 'scrooloose/syntastic'

" Idetificador de cor
Plugin 'ap/vim-css-color'

" HTML CSS
Plugin 'mattn/emmet-vim'

" Vim + Git
Plugin 'tpope/vim-fugitive'

" Número de linha
Plugin 'myusuf3/numbers.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" air-line
set laststatus=2
set t_Co=256
set noshowmode  
let g:airline_theme='simple'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" barra superior
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
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
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Configurações syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Numero de linha
set nu

" Tema escuro
set background=dark

" Tema de cores
colorscheme koehler

" Tabulacoes
highlight NonText ctermfg=234 guifg=#4a4a59
highlight SpecialKey ctermfg=234 guifg=#4a4a59
set list
set listchars=tab:\|\ 
set smarttab

" Cursor
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=234 ctermfg=NONE

" Autocomplete PHP e demais linguagens
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
autocmd FileType c          set omnifunc=ccomplete#Complete

" Code hightligth
let php_sql_query=1                                             
let php_htmlInStrings=1

" Abrir JavaScript minificado 
command! UnMinify call UnMinify()
function! UnMinify()
	%s/{\ze[^\r\n]/{\r/g
	%s/){/) {/g
	%s/};\?\ze[^\r\n]/\0\r/g
	%s/;\ze[^\r\n]/;\r/g
	%s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
	normal ggVG=
endfunction

""Complementação de palavras
set dictionary+=/usr/dict/words
set complete=.,w,k

"====== complementação de palavras ====
""usa o tab em modo insert para completar palavras
function! InsertTabWrapper(direction)
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	elseif "backward" == a:direction
		return "\<c-p>"
	else
		return "\<c-n>"
	endif
endfunction

inoremap <F7> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-F7> <c-r>=InsertTabWrapper ("backward")<cr>

" <F10> proximo buffer, <F9> buffer anterior
map <F10> :bn!<CR>
map <F9> :bp!<CR>

" Fechamento automatico de parenteses
imap { {}<left>
imap ( ()<left>
imap [ []<left>

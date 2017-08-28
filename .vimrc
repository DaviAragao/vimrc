set nocompatible              " be iMproved, required
filetype on                  " required

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
" Plugin 'scrooloose/syntastic'

" Idetificador de cor
Plugin 'ap/vim-css-color'

" HTML CSS
Plugin 'mattn/emmet-vim'

" Vim + Git
Plugin 'tpope/vim-fugitive'

" Número de linha
Plugin 'myusuf3/numbers.vim'

" JavaScript minify
Plugin 'maksimr/vim-jsbeautify'

" JavaScript sintax
Plugin 'sheerun/vim-polyglot'

" HTML sintaxe, e identação
Plugin 'othree/html5.vim'

" Polymer
"Plugin 'webdesus/polymer-ide.vim'
Plugin 'bendavis78/vim-polymer'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Habilita a sintaxe
syntax on

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
map<F6> :lclose<CR>

let g:syntastic_enable_signs=0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Numero de linha
set nu

" Tema escuro
set background=dark

" Tema de cores
colorscheme koehler
syntax on

" Tabulacoes
highlight NonText ctermfg=234 guifg=#4a4a59
highlight SpecialKey ctermfg=234 guifg=#4a4a59
set list
set listchars=tab:\|\ 
set smarttab

" Caminha para a pasta do arquivo
set autochdir

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

" Força o editor interpretar o arquivo e colorir a sintaxe.
autocmd BufNewFile,BufRead * :syntax sync fromstart

" Code hightligth
let php_sql_query=1                                             
let php_htmlInStrings=1

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

" <F10> proximo buffer, <F9> buffer anterior <F8> apaga buffer
map <F10> :bn!<CR>
map <F9> :bp!<CR>
map <F8> :bd<CR>

" Salvar arquivo somente leitura
cmap :w!! w !sudo tee > /dev/null %

" Fechamento automatico de parenteses
imap { {}<left>
imap ( ()<left>
imap [ []<left>

" Ajuste de parênteses
map <F12> :%s/( /(/g<CR> :%s/ )/)/g<CR>

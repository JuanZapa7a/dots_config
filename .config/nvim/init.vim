scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline' "status bar can be customized
Plug 'vim-airline/vim-airline-themes' "themes for vim-airline

call plug#end()

" ..........................................................
" # Settings
" ..........................................................

" ## General
"
set title
set mouse=a " It lets you use mous-e on the terminal
set clipboard+=unnamedplus " Keep what you copy on the clip-board
set updatetime=100
set noshowmode  "Airline muestra la barra de estado
set pumblend=0
set hidden
" Forbidding you to modify a file which is already open in another process
set noswapfile
highlight ColorColumn ctermbg=16 " set color for colorcolumn
set colorcolumn=80  " Set & show limit column 
set scrolloff=3  " Display at least 3 lines around you cursor
set diffopt+=vertical  " Always use vertical diffs

" save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
" number of undo saved
set undolevels=10000
set undoreload=10000

" I disabled the arrow keys to force myself to only use hjkl.
"
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" ## Spelling
"
set spelllang=es_es,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u " CTR-L to correct

" ## Lines
"
set wrap  " wrap lines (no display long lines) fo+=t
set number " Show the numbers on the left
set numberwidth=1 " Set numbers width
set relativenumber " It shows the current cursor line
"set textwidth=80 " Set width of text
"set fo+=a " automatic :help fo-table                                    


set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldnestmax=2
set foldlevel=1

" ## Indent to spaces
"
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab " Insertar espacios en lugar de <Tab>s

" ## Search & replace
"
set ignorecase " Ignorar mayúsculas en una búsqueda
set smartcase " No ignorar mayúsculas si la palabra a buscar tiene mayúsculasgg
set gdefault
set inccommand=nosplit " Show replace live preview

" ## Use rg for :grep
"
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m


" ## Theme & Colorscheme
"
"set termguicolors  " Activa true colors en la terminal y quita powerline
"colorscheme wal
"set background=dark
"https://vim.fandom.com/wiki/Highlight_current_line
set cursorline  " Highlight current line
set cursorcolumn " Highlight current column
hi CursorLine   cterm=bold ctermbg=16 ctermfg=white guibg=gray guifg=white
hi CursorColumn cterm=bold ctermbg=16 ctermfg=white guibg=gray guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
" typing \c will toggle highlighting on and off
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
" pressing \l will highlight the line that currently contains the cursor.
nnoremap <silent> <Leader>c :execute 'match Search /\%'.virtcol('.').'v/'<CR>
" To highlight the current virtual column (column after tabs are expanded), 
" and have the highlighting stay where it is when the cursor is moved 

" ## Airline
"
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiettos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
let g:airline_powerline_fonts = 1 " Cargar fuente Powerline y símbolos (ver nota)
"let g:airline_theme= 'icebergDark'
let g:airline_theme='dark'

" ## NerdTree
"
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
map <F2> :NERDTreeToggle<CR>

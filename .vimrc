" .vimrc - Jane Kim
" https://spilledmilk.github.io

" 256 colourspace
let base16colorspace=256
set t_Co=256

"always show line numbers
:set nu

"always show relative numbers
:set relativenumber

"set encoding
"set encoding=utf8

"set bgcolor
set background=dark

"highlight search
set hlsearch
hi Search cterm=NONE ctermfg=White ctermbg=73

"ignore case
set ic

"mouse usage active
set mouse=a

"window title
set title

"set indentation
set tabstop=2
set smartindent
set expandtab
set autoindent
set shiftwidth=2

"set word wrap
:set wrap
:set linebreak

"color scheme
colorscheme peachpuff
" peachpuff, morning, industry, evening


"****************************
"----------NERDTree----------
"****************************

"auto-start
autocmd StdinReadPre * let s:std_in=1

"no files specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"map shortcut to CTRL+n
map <C-n> :NERDTreeToggle<CR>

"close when NERDTree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


"****************************
"----------vim-plug----------
"****************************
"make sure to use single-quotes
"list plugins with Plug command;
"put between #begin and #end
"any valid git url allowed

"automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"begin plugins section
call plug#begin('~/arch-dotfiles/.vim/plugged')
Plug 'preservim/nerdtree' |
  \ Plug 'Xuyuanp/nerdtree-git-plugin' |
  \ Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-vdebug/vdebug'
Plug 'edkolev/promptline.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree', { 'on' : 'UndotreeToggle'}
Plug 'vim-scripts/colorizer'
Plug 'tpope/vim-repeat'
Plug 'syntastic'
Plug 'honza/vim-snippets'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-syntax-extra'
Plug 'ehamberg/vim-cute-python'

"initialise plugin system
call plug#end()


"****************************
"------vim-neocomplete-------
"****************************
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#enable_auto_select = 1
let g:neosnippet#enable_snipmate_compatibility = 1


"****************************
"-------vim-syntastic--------
"****************************
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height = 3

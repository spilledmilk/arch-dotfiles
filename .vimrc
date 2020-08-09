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

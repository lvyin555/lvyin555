autocmd VimEnter * hi Normal guibg=NONE ctermfg=252 ctermbg=NONE " transparent bg
autocmd VimLeave * set guicursor=a:ver25-blinkwait700-blinkon400-blinkoff250
autocmd VimLeavePre * set guicursor=a:ver25-blinkwait700-blinkon400-blinkoff250
let g:clipboard = {
      \  'name' : 'wsl',
      \  'copy' : {
      \    '+' : 'win32yank -i',
      \    '*' : 'win32yank -i',
      \  },
      \  'paste' : {
      \    '+' : 'win32yank -o',
      \    '*' : 'win32yank -o',
      \  },
      \}
"set clipboard^=unnamed

imap <C-Z> <Esc>unnamed
imap <C-A> <Esc>ggVG
imap <C-S> <Esc>:w!<CR>a
imap <S-C-Z> <Esc><C-R> 
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i

vmap <C-C> "+y
vmap <C-X> "+d
vnoremap <Up> k
vnoremap <Down> j
vnoremap <Lift> h
vnoremap <Right> l

map <S-Q> <Esc>:q!<CR>
map <C-Z> <Esc>u
map <C-A> <Esc>ggVG
map <C-S> <Esc>:w!<CR>
map <S-C-Z> <Esc><C-R> 

noremap j k
noremap k j

noremap y "+y
noremap p "+p

behave mswin
set nowrap
set nu
set mouse=a
set shiftwidth=4
set backspace=indent,eol,start
set guicursor+=a:blinkon0
highlight Comment cterm=underline ctermfg=red ctermbg=blue
autocmd InsertEnter,InsertLeave * set cul!
syntax on
"set guicursor+=a:blinkwait700-blinkon400-blinkoff250
set guicursor+=c-ci-cr:ver25


call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'skywind3bgbg000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
Plug 'skywind3000/vim-terminal-help'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'KabbAmine/yowish.vim'
Plug 'mhinz/vim-startify'
Plug 'kien/rainbow_parentheses.vim'

call plug#end()

map <C-b> :NERDTreeToggle<CR>
imap <C-b> <Esc>:NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShbgowHidden=0
"autocmd VimEnter * if !argc()|NERDTree|endif 
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | set guicursor=a:ver25-blinkwait700-blinkon400-blinkoff250 | qa! | endif
let g:asynctasksbg_term_pxpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let lastsreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__','\.git','\.gmedithub']
let g:NERDTreeShowLineNumbers=1
"let NERDTreeMinimalUI = 1
let lastsreeDirArrbgbgows = 1
let g:asynctasks_term_pn = 1
"let NERDTreeDirArrows=1

let g:apc_enable_ft = {'*':1}
set cpt=.,k,w,b
set shortmess+=c
set completeopt=menu,menuone,noselect

map <A-C-N> <Esc>:AsyncTask figit-build<CR>:AsyncTask file-run<CR>
map! <A-C-N> <Esc>:w!<CR>:AsyncTask file-build<CR>:AsyncTask file-run<CR>
map <F5> <Esc>:AsyncTask file-run<CR>
map! <F5> <Esc>:AsyncTask file-run<CR>
map <F9> <Esc>:AsyncTask file-build<CR>
map! <F9> <Esc>:AsyncTask file-build<CR>
let g:asyncrbase16tmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_pos = 'bottom'
let g:asyncrun_open = 5

let g:apinbow_actibgbgve = 1

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

colorscheme yowish
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

autocmd VimEnter * RainbowParenthesesToggle
autocmd VimEnter * RainbowParenthesesLoadRound 
autocmd VimEnter * RainbowParenthesesLoadSquare 
autocmd VimEnter * RainbowParenthesesLoadBraces
autocmd VimEnter * RainbowParenthesesLoadChevrons

# Cloud
顺便放东西的地方<br>
VIM配置文件<br>
这个配置文件还原了小部分Windows的快捷键,并且做到了剪贴板互通<br>
不过因为我主要使用WSL所以其中粘贴的部分<C-V>是注释的<br>
并且复制和粘贴默认到系统剪贴板,不过剪贴没有(因为我要用来删东西的)<br>
以下列出插件<br>
<https://github.com/scrooloose/nerdtree><br>
<https://github.com/skywind3000/vim-auto-popmenu><br>
<https://github.com/skywind3000/vim-dict><br>
<https://github.com/skywind3000/vim-terminal-help><br>
<https://github.com/skywind3000/asyncrun.vim><br>
<https://github.com/skywind3000/asynctasks.vim><br>
安装<br>
[vim-plug]: https://github.com/junegunn/vim-plug
```
mkdir ~/.vim
cd ~/.vim
mkdir plugged plugin syntax colors doc autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
let g:clipboard = {
  \   'name': 'copy',
  \   'copy': {
  \      '+': ['/mnt/c/win32yank.exe-i --crlf'],
  \      '*': ['termux-clipboard-get'],
  \    },
  \   'paste': {
  \      '+': ['/mnt/c/win32yank.exe-i --crlf'],
  \      '*': ['termux-clipboard-get'],
  \   },
  \   'cache_enabled': 1,
  \ }
nmap <BS> X

imap <C-Z> <Esc>ua
imap <C-A> <Esc>ggVG
imap <C-S> <Esc>:w!<CR>a
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
"inoremap <C-V> <Esc> "+pa

vnoremap <C-C> "+y
vnoremap <C-X> "+d
vnoremap <BS> d
vnoremap <Up> k
vnoremap <Down> j
vnoremap <Left> h
vnoremap <Right> l

map <CR> <Esc>i<CR><Esc>
map <S-Q> <Esc>:q!<CR>
map <C-Z> <Esc>u
map <C-A> <Esc>ggVG
map <C-S> <Esc>:w!<CR>
map <S-C-Z> <Esc><C-R> 

noremap j k
noremap k j
noremap y "+y
noremap p "+p
"noremap <C-V> <Esc> p

behave mswin
set number
set wildmenu
set nowrap
set mouse=a
set shiftwidth=4
set backspace=indent,eol,start
let &t_EI ="\\<Esc>]50;CursorShape=1\\x7"

highlight Comment cterm=underline ctermfg=red ctermbg=blue
autocmd InsertEnter,InsertLeave * set cul!
syntax on

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
Plug 'skywind3000/vim-terminal-help'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

call plug#end()

map <C-b> :NERDTreeToggle<CR>
imap <C-b> <Esc>:NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=0
autocmd vimenter * if !argc()|NERDTree|endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__','\.git','\.github']
let g:NERDTreeShowLineNumbers=1
"let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
""let NERDTreeDirArrows=1

let g:apc_enable_ft = {'*':1}
set cpt=.,k,w,b
set shortmess+=c
set completeopt=menu,menuone,noselect

map <A-C-N> <Esc>:AsyncTask file-build<CR>:AsyncTask file-run<CR>
map! <A-C-N> <Esc>:w!<CR>:AsyncTask file-build<CR>:AsyncTask file-run<CR>
map <F5> <Esc>:AsyncTask file-run<CR>
map! <F5> <Esc>:AsyncTask file-run<CR>
map <F9> <Esc>:AsyncTask file-build<CR>
map! <F9> <Esc>:AsyncTask file-build<CR>
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_pos = 'bottom'
let g:asyncrun_open = 5

```

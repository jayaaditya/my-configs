
" NeoBundle Scripts-----------------------------
if has('vim_starting')  
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)  
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))  
NeoBundleFetch 'Shougo/neobundle.vim'

" ------------------------------------
" THIS IS WHERE YOUR PLUGINS WILL COME
" ------------------------------------
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ensime/ensime-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
"NeoBundle 'ervandew/eclim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'Valloric/YouCompleteMe', {  
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }

call neobundle#end()  

"General Settings
filetype plugin indent on
set number
set tabstop=2
set shiftwidth=2
set expandtab
filetype indent on
set smartindent
syntax on
set backspace=indent,eol,start
set smartcase
tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map ` :buffers<CR>
map <M-t> :tabnew<bar>terminal<CR>
map fs :NERDTreeToggle<CR>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
nnoremap <M-Left> <C-w>h
nnoremap <M-Down> <C-w>j
nnoremap <M-Up> <C-w>k
nnoremap <M-Right> <C-w>l
map <M-S-Right> <C-PageDown>
map <M-S-Left> <C-PageUp>
set nocompatible
nnoremap <F3> :set hlsearch!<CR>

"NerdTree Settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set splitbelow

"vim-airline"
let g:airline#extensions#tabline#enabled = 1

"vim-fugitive
set statusline=%{fugitive#statusline()}

"vim-colors-solarized Settings
syntax enable
set background=dark
colorscheme solarized

NeoBundleCheck

"Pathogen
call pathogen#runtime_append_all_bundles()

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup


"============== Custom scripts ===============
source ~/.vim/after/syntaxcheck.vim


"============== Filetype stuff ===============
filetype plugin on
filetype indent on

"============== Script configs ===============
" let NERDTreeMinimalUI=1
" let NERDTreeDirArrows=1

" Load custom settings
" source ~/.vim/startup/color.vim
" source ~/.vim/startup/commands.vim
" source ~/.vim/startup/functions.vim
" source ~/.vim/startup/mappings.vim
" source ~/.vim/startup/settings.vim

" Syntax-specific settings
" source ~/.vim/startup/js.vim
" source ~/.vim/startup/php.vim
" source ~/.vim/startup/vim.vim
" source ~/.vim/startup/yaml.vim
" source ~/.vim/startup/html.vim


" Basic Settings

set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

" My maps
map <leader>o :setlocal spell! spelllang=en_us<CR>

set splitbelow splitright

" Shortcuts for split nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Shortcut for start Nerdtree
map <C-n> :NERDTreeToggle<CR>


" Enable vim indent guides
let g:indent_guides_enable_on_vim_startup = 1


" Nerdtree cpnfiguration
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Color
color skittles_berry

let mapleader = " "

runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on
set noexpandtab
set shiftwidth=4
set tabstop=4

set hlsearch
set incsearch

set colorcolumn=72,80

if has('gui_running')
	set guifont=Ubuntu\ Mono\ 12
	set guioptions-=m
	set guioptions-=T
	set background=dark
	colorscheme solarized
else
	"colorscheme molokai
	colorscheme slate
endif


" http://www.bestofvim.com/tip/switch-off-current-search/
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" Quicker buffer switching
" http://vim.wikia.com/wiki/Easier_buffer_switching
"nnoremap <Leader>l :ls<CR>
nnoremap <Leader>l :Unite -quick-match buffer<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>d :bd<CR>

" Add new lines
nnoremap <Return> o<ESC>
nnoremap <S-Return> O<ESC>j

" Split line
nnoremap K i<CR><Esc>

" Ctrl-S to save
inoremap <silent> <C-S> <ESC>:w<CR>
nnoremap <silent> <C-S> :w<CR>
" Ctrl-Q to quit completely
nnoremap <silent> <C-Q> :qa<CR>

" Standard shortcuts for insert mode
" Ctrl-V pastes from clipboard
" Ctrl-Z to undo
inoremap <C-V> <C-R>*
inoremap <C-Z> <ESC>ui
"inoremap <C-I> <ESC>a

" Selection shortcuts for insert mode
inoremap <S-Left> <ESC>v
inoremap <S-Right> <ESC>lvl
inoremap <S-Up> <ESC>lvk
inoremap <S-Down> <ESC>lvj
inoremap <C-S-Left> <ESC>vb
inoremap <C-S-Right> <ESC>lve

" Closing brackets and quotes
" http://vim.wikia.com/wiki/Making_Parenthesis_And_Brackets_Handling_Easier
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

" Standard shortcut for visual mode
" Ctrl-C copies to clipboard
vnoremap <C-C> "+y


" Shift-Space to trigger EasyMotion
nmap <silent> <S-Space> <Space><Space>
vmap <silent> <S-Space> <Space><Space>

" Unite yank history
let g:unite_source_history_yank_enable = 1
nnoremap <Leader>y :Unite history/yank<CR>

" Unite file search
nnoremap <Leader>s :Unite -start-insert file_rec<CR>


set wildignore+=ENV*,*/tmp/*,*.pyc,*.so,*.swp,*.zip

let g:ctrlp_working_path_mode = ''


" Reload vimrc on save
" http://www.bestofvim.com/tip/auto-reload-your-vimrc/
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

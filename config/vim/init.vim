if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif


" Options
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent " Indent a new line
set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
set number " Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set cc=80 " Show at 80 column a border for good code style
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim
set undofile " For the undo tree to persist when the editor is closed

" Mappings from vimmer.io
" makes 'n' always search forward and 'N' always search backward 
nnoremap <expr> n (v:searchforward ? 'n' : 'N')
nnoremap <expr> N (v:searchforward ? 'N' : 'n')
onoremap <expr> n (v:searchforward ? 'n' : 'N')
onoremap <expr> N (v:searchforward ? 'N' : 'n')
xnoremap <expr> n (v:searchforward ? 'n' : 'N')
xnoremap <expr> N (v:searchforward ? 'N' : 'n')

" Plugins with vim-plug
" from https://www.youtube.com/watch?v=QB9V__3VO2s
" https://www.chrisatmachine.com/blog/category/neovim/01-vim-plug 
source $HOME/.config/nvim/vim-plug/plugins.vim

" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
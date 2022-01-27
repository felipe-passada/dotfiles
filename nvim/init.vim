set exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set incsearch
set scrolloff=8
set signcolumn=yes
"set guifont="Fira Code" 16

"--------------------------------------------------
" Plugins
"--------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"Plug 'morhetz/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter' 
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

lua << END
require('lualine').setup()
require'nvim-tree'.setup()
END

colorscheme tokyonight
"colorscheme gruvbox 

"---------------------------------------------------
" Key maps
"---------------------------------------------------

let mapleader = "\<space>"

" Utils 
nnoremap <leader>w :w<CR>
"nnoremap <leader>q :q<CR>
nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" Window navigation 
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

"Splited tabs
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Adjust window slipt
nnoremap <silent> <C-S-left> :vertical-resize +3<CR>
nnoremap <silent> <C-S-right> :vertical-resize -3<CR>
nnoremap <silent> <C-S-Up> :resize +3<CR>
nnoremap <silent> <C-S-Down> :resize -3<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>



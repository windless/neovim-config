call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'

Plug 'ybian/smartim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'padde/jump.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/tComment'
Plug 'kassio/neoterm'
Plug 'vimlab/split-term.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'mattn/emmet-vim'
Plug 'qpkorr/vim-bufkill'
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat'
Plug 'vim-scripts/Rename2'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-cucumber'
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'tpope/vim-fugitive'
Plug 'Asheq/close-buffers.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-scripts/indentpython.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'

Plug 'SirVer/ultisnips'
Plug 'ternjs/tern_for_vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'alvan/vim-closetag'

call plug#end()

color dracula

set termguicolors
set nu
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cursorline
set mouse=a
set splitbelow
set splitright
set autoread
au CursorHold * checktime
set list
set listchars=tab:▶‒,nbsp:∙,trail:∙,extends:▶,precedes:◀
let &showbreak = '↳'
" set foldmethod=indent
set foldmethod=indent
set foldlevelstart=99
set noswapfile
au FocusGained * :checktime
" :au FocusLost * silent! wa

au BufNewFile,BufRead *.art set filetype=html
au BufNewFile,BufRead *.css.art set filetype=css
au BufNewFile,BufRead .eslintrc set filetype=json
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

let mapleader=" "

set runtimepath+=~/.vim

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:airline#extensions#tabline#enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\}
nnoremap <silent> <C-]> :ALEGoToDefinition<CR>

let g:user_emmet_leader_key='<C-E>'

" let g:auto_save = 1
" let g:auto_save_no_updatetime = 1
" let g:auto_save_in_insert_mode = 0

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/mySnippets"
let g:UltiSnipsSnippetDirectories = ['mySnippets', 'UltiSnips']

" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.javascript = [
" \ 'tern#Complete',
" \]

set completeopt=longest,menuone
" let g:deoplete#sources = {}
" let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs', 'buffer']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

let g:deoplete#sources#rust#racer_binary='/Users/Abner/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/Abner/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx'

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:session_autosave='no'
let g:session_autoload='no'

nnoremap <Leader>ff :FZF<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fk :Rg<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

nmap <Leader>/ :TComment<CR>
vmap <Leader>/ :TComment<CR>

vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy "+yy
nnoremap <leader>yw "+yw
nnoremap <leader>yi "+yi

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nmap <silent> <Leader>bb :NERDTreeToggle<CR>
nmap <silent> <Leader>bf :NERDTreeFind<CR>
nmap <silent> <Leader>T :Term<CR>
nmap <silent> <Leader>t :VTerm<CR>


let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap f <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

nmap <silent> <Leader>en :ALENextWrap<CR>
nmap <silent> <Leader>ep :ALEPreviousWrap<CR>

nmap <silent> <leader>1 1gt
nmap <silent> <leader>2 2gt
nmap <silent> <leader>3 3gt
nmap <silent> <leader>4 4gt
nmap <silent> <leader>5 5gt


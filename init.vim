call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'

" theme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'chriskempson/base16-vim'

" language
Plug 'dag/vim-fish'

Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'ternjs/tern_for_vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'carlitux/deoplete-ternjs'
Plug 'dunckr/js_alternate.vim'

Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-cucumber'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'sebastianmarkow/deoplete-rust'
Plug 'vim-scripts/indentpython.vim'

Plug 'derekwyatt/vim-scala'

" Plug 'kamykn/spelunker.vim'

" 功能
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'andrep/vimacs'

Plug 'padde/jump.vim'
Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" edit
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/tComment'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'alvan/vim-closetag'

" buffer
Plug 'jlanzarotta/bufexplorer'
Plug 'vimlab/split-term.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'Asheq/close-buffers.vim'
Plug 'chrisbra/NrrwRgn'

Plug 'tpope/vim-fugitive'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'

Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'kassio/neoterm'
Plug 'sbdchd/neoformat'

Plug 'tpope/vim-unimpaired'

call plug#end()

color base16-dracula
" color base16-solarized-light

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
set encoding=UTF-8
set guifont=Hack\ Nerd\ Font\ h11
set colorcolumn=100
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
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\}
let g:ale_fixers = {
  \'javascript': [
    \'eslint',
  \],
\}
let g:ale_sign_column_always = 1
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

nmap <silent> <Leader>T :Term<CR>
nmap <silent> <Leader>t :VTerm<CR>

nnoremap <Leader>ff :FZF<CR>
nnoremap <Leader>fl :Lines<CR>
vmap <silent> <Leader>fr y:Rg <C-r>"<CR>
nmap <silent> <Leader>fr yiw:Rg <C-r>"<CR>
nmap <silent> <Leader>fb :NERDTreeToggle<CR><C-w>l:NERDTreeFind<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

nmap <silent> <Leader>bb :NERDTreeToggle<CR>
nmap <silent> <Leader>bc :Bdelete other<CR>
nmap <Leader>br :e %:h

nmap <Leader>/ :TComment<CR>
vmap <Leader>/ :TComment<CR>

vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy "+yy
nnoremap <leader>yw "+yw
nnoremap <leader>yi "+yi

nnoremap <leader>v :vs<CR>
nnoremap <leader>V :sp<CR>
nnoremap <leader>l :noh<CR>

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

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
nmap <silent> <C-l> :ALEFix<CR>

nmap <silent> <Leader>q :bd<CR>

nmap <Leader>gs :Gstatus<CR>

" 简单 emacs 快捷键
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>

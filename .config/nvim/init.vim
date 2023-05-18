
call plug#begin()
  Plug 'github/copilot.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'flazz/vim-colorschemes'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim', {
    \ 'on': [
            \ 'Ag',
            \ 'Rg',
            \ 'FZF',
            \ 'Files',
            \ 'Buffers',
            \ 'Commits',
            \ 'BCommits',
            \ 'Tags',
            \ 'BTags',
            \ 'History',
            \ 'Lines',
            \ 'BLines',
            \ 'Marks'
        \ ] }
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'raimondi/delimitmate'
  Plug 'mattn/emmet-vim'
  Plug 'alvan/vim-closetag'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'mbbill/undotree'
call plug#end()


" Options
set background=dark

set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set cursorcolumn
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set termguicolors
set background=dark
set autoindent
set smartindent
colorscheme molokai

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

" Syntax
filetype plugin indent on
syntax on

"Color Support
set t_Co=256

"Ctrl + direction to change panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

"Remap esc to 'fj' or 'jf'
imap fj <esc>
imap jf <esc>

" turn off search highlighting with leader <space>
noremap <leader><space> :nohlsearch<CR>


"************CloseTag options **********8
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.js, *.jsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js, jsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx, js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while`<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>' 



"*********** Nerdtree ************
autocmd StdinReadPre * let s:std_in=1
let g:NERDTreeWinSize=40
map <BS> :NERDTreeToggle<CR>
noremap <leader>o :NERDTreeFind<CR>

"******* fzf settings *********
"searches files while respecting .gitignore
noremap <C-p> :Files<Cr>
"searches open files
noremap <Leader>b :Buffers<cr>
"searches current file
noremap <Leader>l :BLines<cr>

let g:fzf_layout = {'down': '~40%'}

"******* Ripgrep *********
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
let g:rg_derive_root='true'
"use RipGrep with /
nmap <leader>a :Rg 

"map :Q & :W to :q and :w for easier 'write' and 'quite'
noremap :Q :q
noremap :W :w

"sync syntax highlighting for large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
"more room for displaying messages
set cmdheight=2
"shorter updatetime
set updatetime=300

nmap <leader>p  <Plug>(GitGutterPreviewHunk)
nmap <leader>s  <Plug>(GitGutterStageHunk)
nmap <leader>u  <Plug>(GitGutterUndoHunk)

noremap <leader>gb :G blame<cr>


"*********** Coc *************8
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

"********** Emmet *************
" Press Ctrl-z, to expand tags
let g:user_emmet_leader_key='<C-Z>'


"********** Undo Tree **********
" noremap <leader>u :UndotreeToggle<CR>

highlight LineNr guifg=white

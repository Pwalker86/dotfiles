" Plugins
call plug#begin('~/.config/nvim/plugged')

" Add your plugins here
Plug 'burntsushi/ripgrep'
Plug 'wincent/ferret'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
" Plug 'junegunn/fzf.vim', {
"     \ 'on': [
"             \ 'Ag',
"             \ 'Rg',
"             \ 'GFiles',
"             \ 'FZF',
"             \ 'Files',
"             \ 'Buffers',
"             \ 'Commits',
"             \ 'BCommits',
"             \ 'Tags',
"             \ 'BTags',
"             \ 'History',
"             \ 'Lines',
"             \ 'BLines',
"             \ 'Marks'
"         \ ] }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine
Plug 'preservim/nerdtree'        " File explorer
Plug 'airblade/vim-gitgutter'    " Git diff in the sign column
Plug 'vim-airline/vim-airline'   " Status bar
Plug 'vim-airline/vim-airline-themes' " Status bar themes
Plug 'mattn/emmet-vim'
Plug 'folke/tokyonight.nvim'
Plug 'olimorris/onedarkpro.nvim'  
Plug 'github/copilot.vim'  " used for copilot in editor
Plug 'zbirenbaum/copilot.lua'  " used for Copilot Chat
Plug 'nvim-lua/plenary.nvim'   " used for Copilot Chat
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'eslint/eslint'
Plug 'alvan/vim-closetag'
Plug 'echasnovski/mini.nvim'
Plug 'echasnovski/mini.icons'
Plug 'dense-analysis/ale'

call plug#end()

" Basic settings
set number              " Show line numbers
set relativenumber      " Show relative line numbers
set tabstop=2           " Number of spaces that a <Tab> in the file counts for
set shiftwidth=2        " Number of spaces to use for each step of (auto)indent
set expandtab           " Use spaces instead of tabs
set smartindent         " Smart autoindenting when starting a new line
set autoindent          " Copy indent from current line when starting a new line
set wrap                " Wrap long lines
set clipboard+=unnamedplus " Use system clipboard
set mouse=a             " Enable mouse support
set splitbelow splitright " split down and to the right
set wildmenu
set wildmode=longest:full,full

" Search settings
set ignorecase          " Ignore case when searching
set smartcase           " Override ignorecase if search pattern contains uppercase
set incsearch           " Show search matches as you type
set hlsearch            " Highlight search matches

" Appearance
set t_Co=256
set termguicolors       " Enable 24-bit RGB colors
" colorscheme onedark_dark
colorscheme tokyonight
set cursorline          " Highlight the current line
highlight CursorLine gui=underline cterm=underline ctermfg=NONE ctermbg=NONE
set cursorcolumn

if &term =~ 'xterm\\|rxvt\\|screen\\|kitty'
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[6 q"
endif

"******** RipGrep settings *************
"use RipGrep with /a
nmap <leader>a :Rg 

"******* fzf settings *********
" " initialize fzf setting dictionary
" let g:fzf_vim = {}
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit', 
  \ }


" Use fd to list files, respecting .gitignore, and limit search to the current project directory
let $FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --follow --exclude .git'
""searches files while respecting .gitignore
" noremap <C-p> :Files<Cr>
noremap <C-p> :FzfLua files<Cr>
""searches open files
" noremap <Leader>b :Buffers<cr>
" noremap <A-p> :Buffers<cr>
noremap <A-p> :FzfLua buffers<cr>
""searches current file
" noremap <Leader>l :BLines<cr>
noremap <Leader>l :FzfLua blines<cr>

let g:fzf_layout = {'down': '~40%'}

"********** NERDTree settings *************
"Toggle NERDTree with leader+e
autocmd StdinReadPre * let s:std_in=1
let g:NERDTreeWinSize=40
map <leader>e :NERDTreeToggle<CR>
noremap <leader>o :NERDTreeFind<CR>

"********** CoC settings *************
" CoC (Conquer of Completion) settings
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-solargraph']

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"********** Airline settings *************
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Additional settings
syntax on                " Enable syntax highlighting
filetype plugin indent on " Enable file type detection and plugins

"Ctrl + direction to change panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

"Remap esc to 'fj' or 'jf'
imap fj <esc>
imap jf <esc>

"map :Q & :W to :q and :w for easier 'write' and 'quite'
noremap :Q :q
noremap :W :w
noremap :Bd :bd
noremap :BD :bd

"more room for displaying messages
set cmdheight=2
"shorter updatetime
set updatetime=300

" turn off search highlighting with leader <space>
noremap <leader><space> :nohlsearch<CR>

"********** Emmet *************
" Press "Ctrl-e," to expand tags. Don't forget the comma!
let g:user_emmet_leader_key='<C-e>'

"********** GitGutter *************
nmap <leader>p  <Plug>(GitGutterPreviewHunk)
nmap <leader>s  <Plug>(GitGutterStageHunk)
nmap <leader>u  <Plug>(GitGutterUndoHunk)

noremap <leader>gb :G blame<cr>

"******** vim-javaScript *************
" Enables syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1

"*********** Github Copilot Chat *************
" Toggle the chat window
nmap <leader>cc  :CopilotChatToggle<CR>
" Review the selected code
nmap <leader>cr  :CopilotChatReview<CR>
" add documentation to the selected code
nmap <leader>cd  :CopilotChatDocs<CR>


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


"sync syntax highlighting for large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:python3_host_prog = '/usr/bin/python3'

"********** ALE settings *************
let g:ale_fixers = {
\   'eruby': ['erb-formatter'],
\   'ruby': ['rubocop'],
\}
let g:ale_lint_on_text_changed='never'
let g:ale_fix_on_save = 1


lua << EOF
require("fzf-lua").setup()
require('mini.icons').setup()
require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
}
require("nvim-treesitter.configs").setup {
 ensure_installed = { "javascript", "json", "html", "css", "typescript", "tsx" },
 highlight = {
   enable = true,
 },
 endwise = {
   enable = true,
 }
}
EOF

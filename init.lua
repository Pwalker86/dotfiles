-- Plugins
-- Initialize plugins
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'burntsushi/ripgrep'
  use 'wincent/ferret'
  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use {'junegunn/fzf.vim', opt = true, cmd = {
    'Ag', 'Rg', 'GFiles', 'FZF', 'Files', 'Buffers', 'Commits', 'BCommits', 'Tags', 'BTags', 'History', 'Lines', 'BLines', 'Marks'
  }}
  use 'maxmellon/vim-jsx-pretty'
  use 'pangloss/vim-javascript'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-rails'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'preservim/nerdtree'
  use 'airblade/vim-gitgutter'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'mattn/emmet-vim'
  use 'folke/tokyonight.nvim'
  use 'olimorris/onedarkpro.nvim'
  use 'github/copilot.vim'
  use 'zbirenbaum/copilot.lua'
  use 'nvim-lua/plenary.nvim'
  use {'CopilotC-Nvim/CopilotChat.nvim', branch = 'canary'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
end)

-- Basic settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.wrap = true
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = 'a'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true

-- Appearance
vim.o.termguicolors = true
vim.cmd [[colorscheme tokyonight]]
vim.o.cursorline = true
vim.cmd [[highlight CursorLine gui=underline cterm=underline ctermfg=NONE ctermbg=NONE]]
vim.o.cursorcolumn = true

if vim.fn.match(vim.o.term, 'xterm\\|rxvt\\|screen\\|kitty') >= 0 then
  vim.o.t_SI = '\e[6 q'
  vim.o.t_EI = '\e[6 q'
end

-- RipGrep settings
vim.api.nvim_set_keymap('n', '<leader>a', ':Rg<CR>', { noremap = true, silent = true })

-- fzf settings
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit'
}
vim.env.FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --follow --exclude .git'
vim.api.nvim_set_keymap('n', '<C-p>', ':GFiles<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-p>', ':Buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':BLines<CR>', { noremap = true, silent = true })
vim.g.fzf_layout = { down = '~40%' }

-- NERDTree settings
vim.cmd [[autocmd StdinReadPre * let s:std_in=1]]
vim.g.NERDTreeWinSize = 40
vim.api.nvim_set_keymap('n', '<leader>e', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', ':NERDTreeFind<CR>', { noremap = true, silent = true })

-- CoC settings
vim.g.coc_global_extensions = {'coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-solargraph'}
vim.api.nvim_set_keymap('n', '<leader>do', '<Plug>(coc-codeaction)', {})
vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', {})
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })
vim.api.nvim_set_keymap('i', '<C-space>', 'coc#refresh()', { silent = true, expr = true })
vim.api.nvim_set_keymap('x', '<leader>f', '<Plug>(coc-format-selected)', {})
vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(coc-format-selected)', {})
vim.api.nvim_set_keymap('n', '<leader>ac', '<Plug>(coc-codeaction)', {})
vim.api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', {})
vim.api.nvim_set_keymap('n', 'K', ':call <SID>show_documentation()<CR>', { silent = true })

function _G.show_documentation()
  if vim.tbl_contains({'vim', 'help'}, vim.bo.filetype) then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  else
    vim.fn.CocAction('doHover')
  end
end

-- Airline settings
vim.g.airline_extensions_tabline_enabled = 1
vim.g.airline_extensions_tabline_formatter = 'unique_tail'

-- Additional settings
vim.cmd [[syntax on]]
vim.cmd [[filetype plugin indent on]]

-- Ctrl + direction to change panes
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })

-- Remap esc to 'fj' or 'jf'
vim.api.nvim_set_keymap('i', 'fj', '<esc>', { noremap = true })
vim.api.nvim_set_keymap('i', 'jf', '<esc>', { noremap = true })

-- Map :Q & :W to :q and :w for easier 'write' and 'quit'
vim.api.nvim_set_keymap('n', ':Q', ':q', { noremap = true })
vim.api.nvim_set_keymap('n', ':W', ':w', { noremap = true })

-- More room for displaying messages
vim.o.cmdheight = 2
-- Shorter updatetime
vim.o.updatetime = 300

-- Turn off search highlighting with leader <space>
vim.api.nvim_set_keymap('n', '<leader><space>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Emmet settings
vim.g.user_emmet_leader_key = '<C-e>'

-- GitGutter settings
vim.api.nvim_set_keymap('n', '<leader>p', '<Plug>(GitGutterPreviewHunk)', {})
vim.api.nvim_set_keymap('n', '<leader>s', '<Plug>(GitGutterStageHunk)', {})
vim.api.nvim_set_keymap('n', '<leader>u', '<Plug>(GitGutterUndoHunk)', {})
vim.api.nvim_set_keymap('n', '<leader>gb', ':G blame<CR>', { noremap = true, silent = true })

-- vim-javascript settings
vim.g.javascript_plugin_jsdoc = 1

-- Github Copilot Chat settings
vim.api.nvim_set_keymap('n', '<leader>cc', ':CopilotChatToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cr', ':CopilotChatReview<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cd', ':CopilotChatDocs<CR>', { noremap = true, silent = true })

-- Sync syntax highlighting for large files
vim.cmd [[autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart]]
vim.cmd [[autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear]]

vim.g.python3_host_prog = '/usr/bin/python3'

require("CopilotChat").setup {
  debug = true,
  -- See Configuration section for rest
}

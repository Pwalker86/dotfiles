return {
  -- Tim Pope's Rails plugins
  {
    "tpope/vim-rails",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "ruby", "eruby", "yaml", "yaml.docker-compose", "ruby.rspec" },
  },
  
  {
    "tpope/vim-bundler",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "ruby", "eruby", "yaml" },
  },
  
  {
    "tpope/vim-endwise",
    event = "InsertEnter",
  },
  
  {
    "tpope/vim-surround",
    event = "BufReadPre",
  },
  
  {
    "tpope/vim-dispatch",
    event = "VeryLazy",
    cmd = { "Dispatch", "Make", "Focus", "Start" },
  },
  
  -- Enhanced Ruby syntax highlighting
  {
    "vim-ruby/vim-ruby",
    ft = { "ruby", "eruby" },
    init = function()
      vim.g.ruby_indent_access_modifier_style = "indent"
      vim.g.ruby_indent_assignment_style = "variable"
      vim.g.ruby_indent_block_style = "do"
    end,
  },
  
  -- ERB/HTML support
  {
    "weizheheng/ror.nvim",
    ft = { "ruby", "eruby" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  
  -- Additional Rails support
  {
    "tpope/vim-projectionist",
    event = "BufReadPre",
  },
  
  -- Minitest support
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>tt", "<cmd>TestNearest<CR>", desc = "Run nearest test" },
      { "<leader>tT", "<cmd>TestFile<CR>", desc = "Run test file" },
      { "<leader>ta", "<cmd>TestSuite<CR>", desc = "Run test suite" },
      { "<leader>tl", "<cmd>TestLast<CR>", desc = "Run last test" },
      { "<leader>tg", "<cmd>TestVisit<CR>", desc = "Go to test file" },
    },
    config = function()
      vim.g["test#strategy"] = "neovim"
      vim.g["test#ruby#minitest#file_pattern"] = "_test\\.rb$"
    end,
  },
}
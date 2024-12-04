return {
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    --load colorscheme here
    vim.cmd([[colorscheme tokyonight]])
  end,
}

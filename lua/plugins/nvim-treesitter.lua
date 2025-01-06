---@diagnostic disable: missing-fields
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "ruby", "typescript", "bash", "regex" },
          sync_install = false,
          highlight = { enable = true },
          endwise = { enable = true },
          indent = { enable = false },
        })
    end
}

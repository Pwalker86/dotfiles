return {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
      float = {
        padding = 2,
        max_width = 80,
        max_height = 30,
      },
      keymaps = {
        ["q"] = "actions.close",
        ["<C-c>"] = "actions.close",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_split",
        ["<C-v>"] = "actions.select_vsplit",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>Oil<CR>", desc = "Open Oil file explorer" },
      { "<leader>E", "<cmd>Oil --float<CR>", desc = "Open Oil in float" },
    },
  }

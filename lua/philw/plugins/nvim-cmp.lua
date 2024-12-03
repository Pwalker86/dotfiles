return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- buffer completion source for nvim-cmp
    "hrsh7th/cmp-path", -- path completion source for nvim-cmp
    "L3MON4D3/LuaSnip", -- snippets for nvim-cmp
    "saadparwaiz1/cmp_luasnip", -- LuaSnip completion source for nvim-cmp
    "rafamadriz/friendly-snippets", -- snippets for nvim-cmp
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(ags.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completiong suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion
        ["<CR>"] = cmp.mapping.confirm({select = false}),
      }),
      -- sources for autocomplete
      sources = cmp.config.sources ({
        { name = "nvim_lsp" },
        { name = "luasnip" }, --snippets
        { name = "buffer" },  -- text from buffer
        { name = "path" },    -- file paths
      })
    })
  end
}

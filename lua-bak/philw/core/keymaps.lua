-- Key mappings
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })

vim.api.nvim_set_keymap("i", "fj", "<esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "jf", "<esc>", { noremap = true })

vim.cmd("command! Q q")
vim.cmd("command! W w")

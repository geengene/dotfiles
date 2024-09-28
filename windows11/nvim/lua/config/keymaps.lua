-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = false })
vim.keymap.set("n", "L", "g$", { noremap = true, silent = false })
vim.keymap.set("n", "H", "g^", { noremap = true, silent = false })
vim.keymap.set("v", "L", "g$", { noremap = true, silent = false })
vim.keymap.set("v", "H", "g^", { noremap = true, silent = false })
vim.keymap.set("o", "H", "^", { noremap = true, silent = false })
vim.keymap.set("o", "L", "$", { noremap = true, silent = false })

vim.keymap.set("v", "q", "<ESC>", { noremap = true, silent = true })

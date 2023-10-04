local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>xx", "<cmdTroubleToggle", opts)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)


vim.keymap.set("n", "<leader>p", "<cmd>PrettierAsync<cr>", { desc = "Format code" })

vim.g["prettier#autoformat"] = 1
vim.g["prettier#autoformat_require_pragma"] = 0

vim.g["prettier#quickfix_enabled"] = 0

vim.g["prettier#exec_cmd_async"] = 1

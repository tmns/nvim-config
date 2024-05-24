-- vim.keymap.set("n", "<leader>p", "<cmd>PrettierAsync<cr>", { desc = "Format code" })
--
-- vim.g["prettier#autoformat"] = 1
-- vim.g["prettier#autoformat_require_pragma"] = 0
--
-- vim.g["prettier#quickfix_enabled"] = 0
--
-- vim.g["prettier#exec_cmd_async"] = 1
--
local prettier = require("prettier")

prettier.setup({
	bin = "prettierd", -- or `'prettierd'`
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	["null-ls"] = { timeout = 10000 },
})

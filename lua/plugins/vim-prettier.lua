return {
	"MunifTanjim/prettier.nvim",
	event = "VeryLazy",
	config = function()
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
	end,
}

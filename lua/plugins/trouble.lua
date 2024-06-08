return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	config = function()
		require("trouble").setup({ icons = false })

		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").open()
		end, { desc = "Toggle trouble" })
		vim.keymap.set("n", "<leader>tw", function()
			require("trouble").open("workspace_diagnostics")
		end, { desc = "Worplace diagnostics" })
		vim.keymap.set("n", "<leader>td", function()
			require("trouble").open("document_diagnostics")
		end, { desc = "Document diagnostics" })
		vim.keymap.set("n", "<leader>tq", function()
			require("trouble").open("quickfix")
		end, { desc = "Quickfix" })
		vim.keymap.set("n", "<leader>tl", function()
			require("trouble").open("loclist")
		end, { desc = "Items from local list" })
		vim.keymap.set("n", "gR", function()
			require("trouble").open("lsp_references")
		end, { desc = "LSP references" })
	end,
}

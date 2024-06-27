return {
	"nvim-pack/nvim-spectre",
	event = "VeryLazy",
	config = function()
		require("spectre").setup({
			replace_engine = { sed = { cmd = "sed", args = { "-i", "", "-E" } } },
		})
	end,
}

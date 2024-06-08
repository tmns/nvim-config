return {
	"projekt0n/github-nvim-theme",
	lazy = false,
	config = function()
		require("github-theme").setup({
			palettes = {
				github_dark_high_contrast = {
					bg0 = "#202030", -- Brighten floats
					bg1 = "#000814", -- Bluish background
					bg2 = "#200818", -- Colorcolumn folds
					bg3 = "#001122", -- Cursor line
					bg4 = "#333333", -- Conceal
					fg3 = "#333366", -- LineNr, LspInlayHint
					sel1 = "#885511", -- IncSearch bg
					sel2 = "#cccc33", -- Search bg
				},
			},
			specs = {
				github_dark_high_contrast = {
					bracket = "#ffffdd", -- cream
					syntax = {
						comment = "#8b949e", -- dark grey
						keyword = "#ffaaff", -- magenta
						operator = "#ffff88", -- pale yellow
						param = "cyan.bright",
						types = "orange.bright",
					},
					bg0 = "bg0",
					bg1 = "bg1",
					bg2 = "bg2",
					bg3 = "bg3",
					bg4 = "bg4",
					fg3 = "fg3",
					sel1 = "sel1",
					sel2 = "sel2",
				},
			},
		})

		vim.cmd.colorscheme("github_dark_high_contrast")
	end,
}

require("lualine").setup({
	options = {
		theme = "auto",
		globalstatus = true,
		disabled_filetypes = { statusline = { "dashboard", "alpha" } },
	},
	sections = {
		lualine_a = { "" },
		lualine_b = { "branch" },
		lualine_c = {
			{ "filename", path = 1 },
			{
				function()
					return require("nvim-navic").get_location()
				end,
				cond = function()
					return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
				end,
			},
		},
		lualine_y = {
			{ "progress", separator = " ", padding = { left = 1, right = 0 } },
			{ "location", padding = { left = 0, right = 1 } },
		},
		lualine_z = {
			function()
				return " " .. os.date("%R")
			end,
		},
	},
})

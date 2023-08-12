vim.opt.foldcolumn = "0" -- '1' will show the column
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

local opts = {
	filetype_exclude = { "help", "alpha", "Trouble", "mason" },
}

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("local_detach_ufo", { clear = true }),
	pattern = opts.filetype_exclude,
	callback = function()
		require("ufo").detach()
	end,
})

require("ufo").setup(opts)

local fzf = require("fzf-lua")

fzf.setup({
	buffers = {
		ignore_current_buffer = true,
		sort_lastused = true,
		file_ignore_patterns = {
			"node_modules/",
			".next/",
			".git/",
			"build/",
			"out/",
			"pnp/",
			"DS_Store",
			".yarn/cache",
			".*ttf$",
			".*svg$",
			"_fresh/",
			"dist/public/storybook",
		},
	},
	files = {
		rg_opts = "--color=never --files --hidden --follow --no-ignore",
		fd_opts = "--color=never --type f --hidden --follow --no-ignore",
		file_ignore_patterns = {
			"node_modules/",
			".next/",
			".git/",
			"build/",
			"out/",
			"pnp/",
			"DS_Store",
			".yarn/cache",
			".*ttf$",
			"_fresh/",
			"dist/public/storybook",
			"package-lock.json",
			"yarn.lock",
		},
	},
})

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", fzf.git_files, { desc = "Find Git files" })
vim.keymap.set("n", "<leader>fr", function()
	fzf.oldfiles({ cwd_only = true })
end, { desc = "Find recent (cwd)" })
vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "Find buffers" })

vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>sG", function()
	fzf.grep({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep input string" })

vim.keymap.set("n", "<leader>sb", fzf.lgrep_curbuf, { desc = "Live grep buffers" })
vim.keymap.set("n", "<leader>sB", function()
	fzf.grep_curbuf({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep input string" })

vim.keymap.set("n", "<leader>rs", fzf.live_grep_resume, { desc = "Resume live grep" })
vim.keymap.set("n", "<leader>sl", fzf.grep_last, { desc = "Re-search last searched" })

vim.keymap.set({ "n", "v" }, "<leader>sw", fzf.grep_cword, { desc = "Search word under cursor" })
vim.keymap.set({ "n", "v" }, "<leader>sW", fzf.grep_cWORD, { desc = "Search Word under cursor" })

vim.keymap.set("n", "<leader>gr", function()
	fzf.lsp_references({ ignore_current_line = true })
end, { desc = "Get references" })

vim.keymap.set("n", "<leader>gd", function()
	fzf.lsp_definitions({ jump_to_single_result = true })
end, { desc = "Get definitions" })

vim.keymap.set("n", "<leader>gi", function()
	fzf.lsp_implementations({ jump_to_single_result = true })
end, { desc = "Get implementations" })

vim.keymap.set("n", "<leader>sd", fzf.diagnostics_document, { desc = "Show document diagnostics" })
vim.keymap.set("n", "<leader>sD", fzf.diagnostics_workspace, { desc = "Show workspace diagnostics" })

vim.keymap.set("n", "<leader>sa", fzf.autocmds, { desc = "Search autocommands" })
vim.keymap.set("n", "<leader>sc", fzf.command_history, { desc = "Search cmd history" })
vim.keymap.set("n", "<leader>sC", fzf.commands, { desc = "Search commands" })
vim.keymap.set("n", "<leader>sh", fzf.help_tags, { desc = "Search help tags" })
vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "Search keymaps" })
vim.keymap.set("n", "<leader>sM", fzf.man_pages, { desc = "Search manpages" })
vim.keymap.set("n", "<leader>sm", fzf.marks, { desc = "Search marks" })
vim.keymap.set("n", "<leader>sh", fzf.search_history, { desc = "Search search history" })
vim.keymap.set("n", "<leader>st", fzf.tmux_buffers, { desc = "List tmux buffers" })
vim.keymap.set("n", "<leader>sq", fzf.quickfix, { desc = "List tmux buffers" })

vim.keymap.set("n", "<leader>ghs", fzf.git_status, { desc = "Git status" })
vim.keymap.set("n", "<leader>ghc", fzf.git_commits, { desc = "Git commits" })
vim.keymap.set("n", "<leader>ghb", fzf.git_branches, { desc = "Git branches" })
vim.keymap.set("n", "<leader>ghx", fzf.git_stash, { desc = "Git stash" })

require("gitsigns").setup({
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 300,
		ignore_whitespace = true,
	},
	current_line_blame_formatter = "<author> • <author_time:%c> • <summary>",

	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<leader>gss", gs.stage_hunk, { desc = "Stage hunk" })
		map("n", "<leader>gsr", gs.reset_hunk, { desc = "Reset hunk" })
		map("v", "<leader>gss", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage hunk" })
		map("v", "<leader>gsr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset hunk" })
		map("n", "<leader>gsS", gs.stage_buffer, { desc = "Stage buffer" })
		map("n", "<leader>gsu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
		map("n", "<leader>gsR", gs.reset_buffer, { desc = "Reset buffer" })
		map("n", "<leader>gsp", gs.preview_hunk, { desc = "Preview hunk" })
		map("n", "<leader>gsb", function()
			gs.blame_line({ full = true })
		end, { desc = "Blame line" })
		map("n", "<leader>gstb", gs.toggle_current_line_blame, { desc = "Toggle blame hint" })
		map("n", "<leader>gsd", gs.diffthis, { desc = "Diff" })
		map("n", "<leader>gsD", function()
			gs.diffthis("~")
		end, { desc = "Diff branch" })
		map("n", "<leader>gstd", gs.toggle_deleted, { desc = "Toggle deleted" })
		-- Text object
		map({ "o", "x" }, "gsh", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns select hunk" })
	end,
})

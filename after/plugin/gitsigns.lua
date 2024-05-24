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

		map("n", "gsn", function()
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

		map("n", "gsx", function()
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "gss", gs.stage_hunk, { desc = "Stage hunk" })
		map("n", "gsr", gs.reset_hunk, { desc = "Reset hunk" })
		map("v", "gss", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage hunk" })
		map("v", "gsr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset hunk" })
		map("n", "gsS", gs.stage_buffer, { desc = "Stage buffer" })
		map("n", "gsu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
		map("n", "gsR", gs.reset_buffer, { desc = "Reset buffer" })
		map("n", "gsp", gs.preview_hunk, { desc = "Preview hunk" })
		map("n", "gsb", function()
			gs.blame_line({ full = true })
		end, { desc = "Blame line" })
		map("n", "gstb", gs.toggle_current_line_blame, { desc = "Toggle blame hint" })
		map("n", "gsd", gs.diffthis, { desc = "Diff" })
		map("n", "gsD", function()
			gs.diffthis("~")
		end, { desc = "Diff branch" })
		map("n", "gstd", gs.toggle_deleted, { desc = "Toggle deleted" })
		-- Text object
		map({ "o", "x" }, "gsh", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns select hunk" })
	end,
})

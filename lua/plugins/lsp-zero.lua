return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "nvimtools/none-ls.nvim" },
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required
	},
	config = function()
		local lsp = require("lsp-zero")

		lsp.preset("recommended")

		require("mason-lspconfig").setup({
			ensure_installed = {
				"tsserver",
				"vimls",
				"lua_ls",
				"tailwindcss",
				"cssls",
				"html",
				"denols",
				"eslint",
			},
		})

		local lspconfig = require("lspconfig")

		-- Ensure `denols` & `tsserver` don't conflict
		lspconfig.denols.setup({
			on_attach = lsp.on_attach,
			root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
		})

		lspconfig.tsserver.setup({
			on_attach = lsp.on_attach,
			root_dir = lspconfig.util.root_pattern("package.json"),
			single_file_support = false,
			init_options = {
				preferences = {
					importModuleSpecifierPreference = "non-relative",
				},
			},
		})

		lsp.on_attach(function(client, bufnr)
			local function opts(desc)
				return { buffer = bufnr, remap = false, desc = desc }
			end

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts("Go to definition"))

			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts("Get info"))

			vim.keymap.set("n", "<leader>ss", function()
				vim.lsp.buf.workspace_symbol()
			end, opts("Workplace symbols"))

			vim.keymap.set("n", "<leader>cd", function()
				vim.diagnostic.open_float()
			end, opts("Line diagnostics"))

			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts("Next diagnostic"))

			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts("Prev diagnostic"))

			vim.keymap.set("n", "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, opts("Line code actions"))

			vim.keymap.set("n", "<leader>cA", function()
				vim.lsp.buf.code_action({
					context = {
						only = {
							"source",
						},
						diagnostics = {},
					},
				})
			end, opts("Document code actions"))

			vim.keymap.set("n", "<leader>cr", function()
				vim.lsp.buf.rename()
			end, opts("Rename under cursor"))

			vim.keymap.set("i", "<C-k>", function()
				vim.lsp.buf.signature_help()
			end, opts("Signature help"))

			client.server_capabilities.documentHighlightProvider = nil
		end)

		lsp.set_sign_icons({
			error = "✘",
			warn = "▲",
			hint = "⚑",
			info = "»",
		})

		-- Fix Undefined global 'vim'
		lsp.configure("lua_ls", {
			cmd = { "lua-language-server" },
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- Enable UFO's code folding
		lsp.set_server_config({
			capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			},
		})

		lsp.setup()

		local null_ls = require("null-ls")
		local null_opts = lsp.build_options("null-ls", {})

		local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
		local event = "BufWritePre" -- or "BufWritePost"
		local async = event == "BufWritePost"

		null_ls.setup({
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.keymap.set("n", "<Leader>p", "<cmd>Prettier<cr>", { desc = "Format with prettier" })

					-- format on save
					vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
					vim.api.nvim_create_autocmd(event, {
						buffer = bufnr,
						group = group,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								async = async,
								filter = function(c)
									return c.name == "null-ls"
								end,
								timeout_ms = 10000,
							})
						end,
						desc = "[lsp] format on save",
					})
				end

				if client.supports_method("textDocument/rangeFormatting") then
					vim.keymap.set("x", "<Leader>p", "<cmd>Prettier<cr>", { desc = "Format with prettier" })
				end

				null_opts.on_attach(client, bufnr)
			end,
			sources = {
				--- Replace these with the tools you have installed
				null_ls.builtins.formatting.stylua,
			},
		})

		-- You need to setup `cmp` after lsp-zero
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_action = require("lsp-zero").cmp_action()

		cmp.setup({
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),

				-- `Tab` key to confirm completion
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
					elseif require("luasnip").expand_or_jumpable() then
						vim.fn.feedkeys(
							vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
							""
						)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),

				-- Ctrl+Space to trigger completion menu
				["<C-Space>"] = cmp.mapping.complete(),

				-- Navigate between snippet placeholder
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}

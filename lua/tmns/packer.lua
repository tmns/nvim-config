-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Simple plugins can be specified as strings
	use("rstacruz/vim-closer")

	use("projekt0n/github-nvim-theme")
	use("aktersnurra/no-clown-fiesta.nvim")

	use({ "nvim-treesitter/nvim-treesitter", commit = "63260da" }, { run = ":TSUpdate" })
	-- use("nvim-treesitter/nvim-treesitter-context")
	use("mbbill/undotree")
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = false,
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use("nvim-pack/nvim-spectre")
	use("lewis6991/gitsigns.nvim")
	use("RRethy/vim-illuminate")
	use("echasnovski/mini.bufremove")
	use("echasnovski/mini.surround")
	use("echasnovski/mini.comment")
	-- use("echasnovski/mini.indentscope")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({ "stevearc/dressing.nvim" })
	use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } })
	use({ "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" })
	use({ "folke/noice.nvim", requires = "MunifTanjim/nui.nvim" })
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use("mg979/vim-visual-multi", { branch = "master" })
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				--
			})
		end,
	})
	use("nvim-tree/nvim-web-devicons")
	use({
		"ibhagwan/fzf-lua",
		-- optional for icon support
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("MunifTanjim/prettier.nvim")
end)

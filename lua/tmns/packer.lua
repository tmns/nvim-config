-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("rstacruz/vim-closer")

	use("projekt0n/github-nvim-theme")

	use({ "nvim-treesitter/nvim-treesitter", commit = "63260da" }, { run = ":TSUpdate" })
	use("nvim-lua/plenary.nvim")
	use("nvim-treesitter/nvim-treesitter-context")
	use("mbbill/undotree")
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
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use("mg979/vim-visual-multi", { branch = "master" })
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

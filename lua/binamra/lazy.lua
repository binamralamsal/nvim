local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{ "nvim-treesitter/nvim-treesitter" },
	{ "ThePrimeagen/harpoon" },

	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
		},
	},

	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'rafamadriz/friendly-snippets',
		},
	},

	{
		'lewis6991/gitsigns.nvim',
	},

	{
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function()
			require('onedark').setup {
				style = 'dark'
			}
			vim.cmd.colorscheme 'onedark'
		end,
	},

	{ 'numToStr/Comment.nvim', opts = {} },
}, {})


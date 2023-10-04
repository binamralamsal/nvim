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
  "nvim-treesitter/nvim-treesitter",

  "ThePrimeagen/harpoon",

  "nvim-telescope/telescope.nvim",

  "nvim-lua/plenary.nvim",

  "mbbill/undotree",

  "tpope/vim-fugitive",

  "folke/trouble.nvim",

  'lewis6991/gitsigns.nvim',

  'numToStr/Comment.nvim',

  "m4xshen/autoclose.nvim",

  "lukas-reineke/indent-blankline.nvim",

  "jose-elias-alvarez/null-ls.nvim",

  'navarasu/onedark.nvim',

  "christoomey/vim-tmux-navigator",

  { "windwp/nvim-ts-autotag",   config = true },

  { "ray-x/lsp_signature.nvim", config = true },

  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },

  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

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

}, {})

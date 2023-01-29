local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

lazy.setup({
	root = vim.fn.stdpath("data") .. "/lazy",
	{
		"neovim/nvim-lspconfig",
		dependencies = {
      -- LSP Stuff
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",
      "glepnir/lspsaga.nvim",

      -- Completions 
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"lukas-reineke/cmp-under-comparator",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			-- Lsp Configs
			require("plugins.configs.lsp")
			-- Completions
			require("plugins.configs.cmp")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("plugins.configs.lualine")
		end,
	},
	{
		"akinsho/bufferline.nvim",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>e", "<cmd>NeoTreeFocusToggle<cr>", desc = "NeoTree" },
		},
		config = function()
			require("plugins.configs.neotree")
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim", event = "BufEnter" },

	"nvim-treesitter/nvim-treesitter",
	"windwp/nvim-ts-autotag",

	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("plugins.configs.colorschemes")
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "windwp/nvim-autopairs", config = true, event = "InsertEnter" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	"nvim-telescope/telescope-ui-select.nvim",

	{ "numToStr/Comment.nvim", config = true, event = "BufEnter" },
	{ "folke/tokyonight.nvim" },
	{ "phaazon/hop.nvim", config = true, event = "BufEnter" },
	{ "lewis6991/gitsigns.nvim", config = true, event = "BufEnter" },
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "NeoTree" },
		},
	},
	{ "iamcco/markdown-preview.nvim", ft = "markdown" },

	{
		"karb94/neoscroll.nvim",
		event = "BufEnter",
    config = function ()
      require("neoscroll").setup({})
    end 
	},
	"goolord/alpha-nvim",
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.configs.toggleterm")
		end,
	},
})

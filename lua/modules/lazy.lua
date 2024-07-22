local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	}
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ 'molecule-man/telescope-menufacture' },
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
	},
	{
		'f-person/git-blame.nvim'
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'olivercederborg/poimandres.nvim',
		lazy = false,
		priority = 1000,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},
	{
		'williamboman/mason.nvim',
		opts = {
			ensure_installed = {
				"js-debug-adapter"
			}
		}
	},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'jose-elias-alvarez/null-ls.nvim'},
	{'MunifTanjim/prettier.nvim'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		}
	},
	{
		"romgrk/barbar.nvim"
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		'mxsdev/nvim-dap-vscode-js',
		dependencies = {
			'microsoft/vscode-js-debug',
			version = '1.x',
			build = 'npm i && npm run compile vsDebugServerBundle && mv dist out',
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
		config = function ()
			local dap = require('dap')
			local dapui = require('dapui')
			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.after.event_terminated["dapui_config"]  = dapui.close
			dap.listeners.before.event_exited["dapui_config"]     = dapui.close
		end
	}
})

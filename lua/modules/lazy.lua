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
		-- or                              , branch = '0.1.x',
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
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
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
		config = function()
			local dap = require 'dap'
			--local utils = require 'dap.utils'
			local dap_js = require 'dap-vscode-js'
			--local mason = require 'mason-registry'

			---@diagnostic disable-next-line: missing-fields
			dap_js.setup {
				-- debugger_path = mason.get_package('js-debug-adapter'):get_install_path(),
				debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
				adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
			}

			local langs = { 'javascript', 'typescript' }
			for _, lang in ipairs(langs) do
				dap.configurations[lang] = {
					{
						type    = 'pwa-node',
						request = 'attach',
						name    = 'Attach debugger to existing `node --inspect` process',
						cwd     = '${workspaceFolder}',
						skipFiles = {
							'${workspaceFolder}/node_modules/**/*.js',
							'${workspaceFolder}/packages/**/node_modules/**/*.js',
							'${workspaceFolder}/packages/**/**/node_modules/**/*.js',
							'<node_internals>/**',
							'node_modules/**',
						},
						localRoot = '${workspaceFolder}',
						sourceMaps = true,
						resolveSourceMapLocations = {
							'${workspaceFolder}/**',
							'!**/node_modules/**',
						},
						remoteRoot = "/app"
					},
				}
			end
		end,
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

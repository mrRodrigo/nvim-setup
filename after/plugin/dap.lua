
-- KEYMAP

vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint <CR>")
vim.keymap.set("n", "<leader>dr", ":DapContinue <CR>")

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
        {
            type    = 'pwa-node',
            request = 'attach',
            name    = 'Attach debugger to LOCAL JS `node --inspect` process',
            cwd     = '${workspaceFolder}',
            skipFiles = {
                '${workspaceFolder}/node_modules/**/*.js',
                '${workspaceFolder}/packages/**/node_modules/**/*.js',
                '${workspaceFolder}/packages/**/**/node_modules/**/*.js',
                '<node_internals>/**',
                'node_modules/**',
            },
        },
        {
            type    = 'pwa-node',
            request = 'attach',
            name    = 'Attach debugger to LEGACY LOCAL JS `node --debug` process',
            cwd     = '${workspaceFolder}',
            skipFiles = {
                '${workspaceFolder}/node_modules/**/*.js',
                '${workspaceFolder}/packages/**/node_modules/**/*.js',
                '${workspaceFolder}/packages/**/**/node_modules/**/*.js',
                '<node_internals>/**',
                'node_modules/**',
            },
        }

	}
end


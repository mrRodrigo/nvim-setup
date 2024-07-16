local builtin = require('telescope.builtin')
require('telescope').load_extension 'menufacture'

require('telescope').setup {
	defaults = {
		path_display = { "smart" },
		file_ignore_patterns = { 
			"node_modules" 
		},
	}
}

vim.keymap.set('n', '<leader>ff', require('telescope').extensions.menufacture.find_files, {})

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})



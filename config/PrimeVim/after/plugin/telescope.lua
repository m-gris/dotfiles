local builtin = require('telescope.builtin')

-- ALL FILES FUZZY SEARCH
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- ???????????
-- vim.keymap.set('n', '<leader>faf', function() builtin.find_files({ cwd = vim.fn.getcwd() }) end, {})

-- ALL GIT FILES FUZZY SEARCH
vim.keymap.set('n', '<learder>fg', builtin.git_files, {})

-- SEARCH ALL PROJECT FILES CONTAINING A PATTERN / STR 
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

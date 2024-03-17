local builtin = require('telescope.builtin')

-- ALL FILES FUZZY SEARCH
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- GPT suggestion: to include files in the gitignore (ex: csv etc...)
vim.keymap.set('n', '<leader>ff', function() 
  builtin.find_files({ find_command = {'rg', '--files', '--no-ignore'} }) 
end, {})

-- GPT suggestion:   to search only dirs
vim.keymap.set('n', '<leader>fd', function()
  builtin.find_files({ find_command = {'fd', '--type', 'd', '--hidden'} })
end, {})

vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--
-- TO QUICKLY ACCESS VIM DOCUMENTATION !!!!
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--
-- ???????????
vim.keymap.set('n', '<leader>faf', function() builtin.find_files({ cwd = vim.fn.getcwd() }) end, {})

-- ALL GIT FILES FUZZY SEARCH
-- vim.keymap.set('n', '<learder>fg', builtin.git_files, {})

-- SEARCH ALL PROJECT FILES CONTAINING A PATTERN / STR 
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)



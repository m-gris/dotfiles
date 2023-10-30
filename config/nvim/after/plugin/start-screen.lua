
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- STARTIFY SETUP
-- source chris@machine : https://www.chiarulli.me/Neovim/11-startify/
vim.g.startify_session_dir = '~/.config/nvim/session'
vim.g.startify_lists = {
  { type = 'dir', header = {'   Current Directory: ' .. vim.fn.getcwd()} },
  { type = 'files', header = {'   Recent Files'} },
  { type = 'sessions', header = {'   Sessions'} },
  { type = 'bookmarks', header = {'   Bookmarks'} },
}
vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_session_persistence = 1
vim.g.startify_enable_special = 0

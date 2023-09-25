-- REMAP SPACE BAR AS LEADER KEY
vim.g.mapleader = " "

-- REMAP, IN NORMAL MODE, LEADER + pv 
-- TO EXECUTE vim.cmd.Ex
-- vim.api.nvim_set_keymap("n", "<leader>pv", ":Ex<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- allow to move around highlighted text
-- (will automatically indent stuffs !)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep the cursor where it is when joining lines 
-- (instead to moving the cursor to the end of the line)
vim.keymap.set("n", "J", "mzJ`z")


-- Keep cursor in the middle of the screen
-- When jumping with D and U
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep the cursor in the middle of the screen
-- when searching 
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- greatest remap ever
-- paste on highlited text 
-- without "auto-yanking" the overwritten text
-- allows pasting over and over 
-- without loosing the originally yanked text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever
-- give the ability to yank into the system clipboard
-- (to only have it into vim's register yank without leader)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- DELETING INTO THE VOID REGISTER
-- We've mapped it elsewhere to 'x'
--vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Make Ctrl-C completely identical to Escape
-- Some subtle diff. that bothered him due to habits...
vim.keymap.set("i", "<C-c>", "<Esc>")

-- DISABLE 'Q' 
-- default => enter Ex mode (a line-editing mode for executing vim commands)
vim.keymap.set("n", "Q", "<nop>")


-- NOT WORKING
-- use Ctrl F to open a new tmux session 
--  run a shell command that opens a new tmux window 
--  running tmux-sessionizer. 
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


-- ???? 
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

---  FOR QUICKFIX navigation
-- to checkout out (so good according to him 
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


-- POWERFULL SUBSTITUTION !!!
-- space s
-- highlight and replace all instances of the word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- MAKE FILE EXECUTABLE !!!
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)



-- MARC
-- COPY THE CURRENT FILE'S PATH WITH LEADER + CP
vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

-- SPLIT PANES VERITCALLY & HORIZONTALLY (IN THE SAME PATH AS THE ORIGINAL WINDOW / PANE)
vim.api.nvim_set_keymap('n', '<C-W>\\', ':split<CR>:lcd %:p:h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-W>|', ':vsplit<CR>:lcd %:p:h<CR>', { noremap = true, silent = true })


-- switch between git-worktrees
vim.keymap.set("n", "<Leader>ft", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)
-- create a new git-worktree
vim.keymap.set("n", "<Leader>fT", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", silent)


-- use telescope file-browser to EXPLORE DIRECTORIES
vim.api.nvim_set_keymap(
  "n",
  "<space>fd",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

-- use telescope file-browser to EXPLORE CURRENT DIRECTORY
vim.api.nvim_set_keymap(
  "n",
  "<space>fD",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

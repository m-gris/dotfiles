-- REMAP SPACE BAR AS LEADER KEY
vim.g.mapleader = " "

-- REMAP, IN NORMAL MODE, LEADER + pv
-- TO EXECUTE vim.cmd.Ex
-- vim.api.nvim_set_keymap("n", "<leader>pv", ":Ex<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)


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
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
-- paste on highlited text
-- without "auto-yanking" the overwritten text
-- allows pasting over and over
-- without loosing the originally yanked text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever
-- give the ability to yank into the system clipboard
-- (to only have it into vim's register yank without leader)
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

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
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

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

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/marc/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)


-- MARC
-- COPY THE CURRENT FILE'S PATH WITH LEADER + CP
vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

-- SPLIT PANES VERITCALLY & HORIZONTALLY (IN THE SAME PATH AS THE ORIGINAL WINDOW / PANE)
vim.api.nvim_set_keymap('n', '<C-W>\\', ':split<CR>:lcd %:p:h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-W>|', ':vsplit<CR>:lcd %:p:h<CR>', { noremap = true, silent = true })


-- switch between git-worktrees
vim.keymap.set("n", "<Leader>ft", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)
-- create a new git-worktree
vim.keymap.set("n", "<Leader>fT", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
    silent)


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


vim.api.nvim_set_keymap('n', '<leader>tr',
    ':NvimTreeToggle<CR>', { noremap = true, silent = false })



-- setup mapping to call :LazyGit
-- nnoremap <silent> <leader>gg :LazyGit<CR>
-- vim.keymap.set({mode='n', lhs='<leader>gg', rhs=':LazyGit<CR>', options={silent=true, noremap=true}})
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

-- Toggle Rnvimr with 'leader + r'
vim.api.nvim_set_keymap('n', '<leader>rr', ':RnvimrToggle<CR>', { noremap = true, silent = true })

-- Resize Rnvimr with 'leader + R'
vim.api.nvim_set_keymap('n', '<leader>R', ':RnvimrResize<CR>', { noremap = true, silent = true })



-- Vinegar like behavior for oil plugin
-- Pressing dash while in normal mode will open the dir where the file is.
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- vim.keymap.set("n", "-", "<CMD>NvimTreeFindFile<CR>", { desc = "Open parent directory" })

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- NOW 
-- FROM CHRIS@MACHINE NEOVIM FROM SCRATCH

local opts = { noremap = true, silent = true }   -- silent => we do not want to see outputs for maps !!! 

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- NAVIGATION
-- NOT WORKING... POSSIBLE CONFLICT WITH TMUX-NAVIGATOR
-- vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
-- vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
-- vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
-- vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)



-- Visual --
-- Stay in indent mode (otherwise must re-select after each indent) 
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- RUN PYTHON SCRIPT
vim.api.nvim_set_keymap('n', '<leader>rp',
    ":update<CR>:exec '!python3' shellescape(@%, 1)<CR>", 
    { noremap = true, silent = false })

-- Search highlited text on google 
vim.api.nvim_set_keymap('x', '<Leader>w', '<Plug>SearchVisual', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', '<Plug>SearchNormal', { silent = true })

-- DASH DOCUMENTATION
vim.api.nvim_set_keymap('n', '<Leader>d', ':Dash<cr>', {noremap = true})

-- DEBUG shortcuts / bindings 
vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').open()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>dk", ":lua require('dapui').close()<CR>", {noremap = true})


-- Unbind to default vim bindings (to allows use by tmux) 
-- vim.api.nvim_del_keymap('n', '<C-[>')
-- vim.api.nvim_del_keymap('n', '<C-]>')


-- TOGGLETERM WITH APPS / CMD 
vim.api.nvim_set_keymap('n', '<leader>sd', '<cmd>lua _NCDU_TOGGLE()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', '<cmd>lua _HTOP_TOGGLE()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sp', '<cmd>lua _PYTHON_TOGGLE()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>rr', '<cmd>lua _RANGER_TOGGLE()<CR>', { noremap = true, silent = true })


-- TODO navigation  
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })

-- BUFFER NAVIGATION 
vim.keymap.set("n", "<leader>n", ":bnext<CR>")
vim.keymap.set("n", "<leader>p", ":bprevious<CR>")
vim.keymap.set("n", "<leader>db", ":bd<CR>")

-- GLANCE (hover etc...) 
vim.keymap.set('n', '<leader>gD', '<CMD>Glance definitions<CR>')
vim.keymap.set('n', '<leader>gR', '<CMD>Glance references<CR>')
vim.keymap.set('n', '<leader>gY', '<CMD>Glance type_definitions<CR>')
vim.keymap.set('n', '<leader>gM', '<CMD>Glance implementations<CR>')

--------------------------------------
-- CURSOR
--- -"FAT" 
-- vim.opt.guicursor = ""
-- THIN
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
--------------------------------------


--------------------------------------
-- visual line helpers 
vim.opt.cursorline = true -- highlight the current line
vim.opt.showtabline = 2 -- always show tabs
--------------------------------------

--------------------------------------
-- Line numbers in the gutter.
vim.opt.number = true
vim.opt.relativenumber = true
--------------------------------------



--------------------------------------
-- 4 SPACE INDENTING
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
--------------------------------------


--------------------------------------
-- enables smart indentation in NeoVim, 
-- automatically indenting new lines based on 
-- the previous line's indentation and language-specific rules.
vim.opt.smartindent= true


-- disables line wrapping 
-- making long lines appear as 
-- a single, horizontally-scrollable line 
-- instead of breaking onto multiple lines.
vim.opt.wrap = false
--------------------------------------

--------------------------------------
-- BACKUPS & UNDOS 
vim.opt.swapfile = false
vim.opt.backup = false
-- to allow super long undo trees (go back days ago...)
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
--------------------------------------


--------------------------------------
--- SEARCH & HIGHLIHTS
vim.opt.hlsearch = false
-- REALLY USEFULL
-- Incremental Search
-- will progressively highlight 
-- cool when unsure about the search pattern !!!
vim.opt.incsearch = true
--------------------------------------



--------------------------------------
-- TERMINAL COLORS
-- enables 24-bit RGB color support 
-- in the terminal for NeoVim, 
-- allowing for a richer color experience.
vim.opt.termguicolors = true
--------------------------------------



--------------------------------------
-- always have a "8 line" buffer when scrolling
-- up or down 
-- (except when end / beg. of file
vim.opt.scrolloff = 8

-- a dedicated column for displaying signs 
-- like breakpoints or Git markers, 
vim.opt.signcolumn = "yes"
--
-- include the "@" and "-" characters 
-- as part of what's considered a filename
-- Useful for navigating or manipulating filenames with these characters.
vim.opt.isfname:append("@-@")


-- sets the time (in milliseconds) NeoVim waits 
-- before triggering the CursorHold event and updating the swap file. 
-- Lower values make these updates more frequent.
vim.opt.updatetime = 50

--sets a vertical line at the 80th column in NeoVim, 
--often used as a visual aid for code line length.
vim.opt.colorcolumn = "80"

vim.g.mapleader = " " 




---------------------------------------------------
-- MARC'S CONFIG
----------------------------------------------------


----------------------------------------------------
-- ChatGPT -- start
-- to allow for text yanked in nvim to enter the system "clipboard"
-- COMMENTED BECAUSE WE HAVE A BETTER BINDING
-- ALLOWING TO CHOOSE TO YANK INTO CLIPBOARD
-- OR TO YANK ONLY IN VIM REGISTERS
vim.o.clipboard = "unnamedplus"
-- ChatGPT -- end
----------------------------------------------------


----------------------------------------------------
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/ -- start

-- MOUSE USE
vim.o.mouse = 'a' -- let you use the mouse for some things, like select text or change the size of window...
                  -- 'a' probably stands for "all" modes... 
                  --
-- Make search ignore uppercase letters unless the search term has an uppercase letter. 
vim.opt.ignorecase = true
vim.opt.smartcase= true

-- do NOT store deletion with 'x' into registers
vim.keymap.set({'n', 'x'}, 'x', '"_x')


-- Select all text in current file / buffer
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/ -- end
----------------------------------------------------



-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd([[colorscheme catppuccin]])

-- !!!!!! FOR VIMWIKI
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
vim.g.vimwiki_list = {{path = '~/Documents/Obsidian/obsidian-test', syntax = 'markdown', ext = '.md'}}
-- !!!!!! FOR VIMWIKI

vim.opt.foldlevel = 1
vim.opt.foldmethod = 'indent'


-- to toggle inline linting errors etc... 
-- source: 
-- https://www.reddit.com/r/neovim/comments/13wcqdr/disable_hintslsperrors_etc/
vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })

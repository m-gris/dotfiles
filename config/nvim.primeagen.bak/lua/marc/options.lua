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
vim.opt.cursorcolumn = true -- highlight the current line
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
vim.cmd("colorscheme kanagawa")

-- @@@@ DYNAMIC - PER LANGUAGE COLORSCHEMES @@@@
-- local cmd_str = [[
--   autocmd BufEnter * if &ft == 'lua'     | colorscheme duskfox      | 
--               \ elseif &ft == 'ocaml'    | colorscheme melange      | 
--               \ elseif &ft == 'python'   | colorscheme catppuccin   | 
--               \ elseif &ft == 'markdown' | colorscheme apprentice   | 
--               \ else                     | colorscheme kanagawa     | 
--               \ endif
-- ]]
--
-- vim.cmd[[ augroup MyColors ]]
-- vim.cmd[[   autocmd! ]]
-- vim.cmd("   " .. cmd_str)
-- vim.cmd[[ augroup END ]]




-- -- @@@@ FLOATING WINDOW WITH PROJECT NAME
-- --
-- function _G.show_project_name()
--     local handle = io.popen("git rev-parse --show-toplevel 2> /dev/null")
--     local result = handle:read("*a")
--     handle:close()
--     local project_name = result:gsub("\n", "")
--     project_name = project_name:match(".+/(.+)")
--     if project_name then
--         local buf = vim.api.nvim_create_buf(false, true)
--         local width = vim.api.nvim_get_option("columns")
--         local win = vim.api.nvim_open_win(buf, false, {relative="editor", width=20, height=1, row=2, col=width - 22})
--         vim.api.nvim_buf_set_lines(buf, 0, -1, false, {"Project: " .. project_name})
--         vim.api.nvim_win_set_option(win, 'winhl', 'Normal:MyHighlight')
--     end
-- end
-- vim.cmd[[ augroup ProjectName ]]
-- vim.cmd[[   autocmd! ]]
-- vim.cmd[[   autocmd BufEnter * lua show_project_name() ]]
-- vim.cmd[[ augroup END ]]
--
--
-- CODY's SUGGESTION 

local function get_project_name()

  -- Walk up directories until we find root
  local cwd = vim.fn.getcwd()
  local git_root = nil
  
  while true do
    if vim.fn.isdirectory(cwd .. '/.git') == 1 then
      git_root = cwd
      break
    end
    cwd = vim.fn.fnamemodify(cwd, ':h')
    if cwd == '/' then
      break
    end
  end

  -- Read project name from git config 
  local name = nil
  if git_root then
    local git_config = io.open(git_root .. '/.git/config', 'r')
    if git_config then
      for line in git_config:lines() do
        if line:match('^[[:blank:]]*url') then
          name = line:match('^[[:blank:]]*url.*/(.+).git$')
          break
        end
      end
      git_config:close()
    end
  end
  
  -- Fallback to directory name
  if not name then 
    name = vim.fn.fnamemodify(cwd, ':t')
  end

  return name
end

function show_project_name()
  local name = get_project_name()

  if name then
    -- existing window logic
  end
end
-- ##################


--
-- !!!!!! FOR VIMWIKI
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
vim.g.vimwiki_list = {{path = '~/Documents/Obsidian/obsidian-test', syntax = 'markdown', ext = '.md'}}
-- !!!!!! FOR VIMWIKI

-- @@@@ FOLDS @@@@@@@@@@@@@@@@@@@
vim.opt.foldcolumn="1"
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevel = 1 -- OPEN FILE WITH CLOSE FOLDS (AS A REMINDER TO USE FOLDS)

-- ##############################

-- For OCAML 
vim.opt.rtp:prepend("~/.opam/default/share/ocp-indent/vim")

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
-- Disable diagnostic by default
vim.cmd("autocmd VimEnter * DiagnosticToggle")

--- trying to make neovim "transparent", by inheriting Kitty's settings
vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
--- but make pop-up windows opaque 
-- vim.opt.pumblend=0
-- vim.opt.winblend=100

vim.o.timeoutlen = 2000

-- for CSV plugin (vim shall detect csv and use the plugin automatically)
vim.cmd('filetype plugin on')   
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--------- NOTEBOOK / IPYTHON CELLS -----------

-- Configuration for vim-slime 
-- Set the target to 'tmux'
vim.g.slime_target = 'tmux'
-- Enable IPython-friendly paste
vim.g.slime_python_ipython = 1
-- Set the default tmux target pane and socket name
vim.g.slime_default_config = {
  socket_name = vim.fn.split(vim.env.TMUX, ',')[1],
  target_pane = '{bottom-right}'
}
-- Don't ask for configuration by default
vim.g.slime_dont_ask_default = 1

-- Configuration for vim-ipython-cell
-- Keyboard mappings for IPythonCell commands
-- Start IPython: in normal mode <\ s> (backslash s)
vim.api.nvim_set_keymap('n', '\\s', ':SlimeSend1 ipython --matplotlib<CR>', {})
-- Run script: in normal mode <\ r> (blackslash r)
vim.api.nvim_set_keymap('n', '\\r', ':IPythonCellRun<CR>', {})

-- Run script and time execution
vim.api.nvim_set_keymap('n', '\\R', ':IPythonCellRunTime<CR>', {})
-- Execute the current cell
vim.api.nvim_set_keymap('n', '\\c', ':IPythonCellExecuteCell<CR>', {})
-- Execute current cell and jump to next
vim.api.nvim_set_keymap('n', '\\C', ':IPythonCellExecuteCellJump<CR>', {})
-- Clear IPython screen
vim.api.nvim_set_keymap('n', '\\l', ':IPythonCellClear<CR>', {})
-- Close all Matplotlib figure windows
vim.api.nvim_set_keymap('n', '\\x', ':IPythonCellClose<CR>', {})
-- Jump to previous cell header
vim.api.nvim_set_keymap('n', '[c', ':IPythonCellPrevCell<CR>', {})
-- Jump to next cell header
vim.api.nvim_set_keymap('n', ']c', ':IPythonCellNextCell<CR>', {})
-- Send current line or selection to IPython
vim.api.nvim_set_keymap('n', '\\h', '<Plug>SlimeLineSend', {})
vim.api.nvim_set_keymap('x', '\\h', '<Plug>SlimeRegionSend', {})
-- Run the previous command in IPython
vim.api.nvim_set_keymap('n', '\\p', ':IPythonCellPrevCommand<CR>', {})
-- Restart IPython
vim.api.nvim_set_keymap('n', '\\Q', ':IPythonCellRestart<CR>', {})
-- Start debug mode in IPython
vim.api.nvim_set_keymap('n', '\\d', ':SlimeSend1 %debug<CR>', {})
-- Exit debug mode or IPython
vim.api.nvim_set_keymap('n', '\\q', ':SlimeSend1 exit<CR>', {})
-- Insert a cell header tag above and enter insert mode
vim.api.nvim_set_keymap('n', '<F9>', ':IPythonCellInsertAbove<CR>a', {})
-- Insert a cell header tag below and enter insert mode
vim.api.nvim_set_keymap('n', '<F10>', ':IPythonCellInsertBelow<CR>a', {})
-- Make <F9> and <F10> work in insert mode to insert cell header
vim.api.nvim_set_keymap('i', '<F9>', '<C-o>:IPythonCellInsertAbove<CR>', {})
vim.api.nvim_set_keymap('i', '<F10>', '<C-o>:IPythonCellInsertBelow<CR>', {})
--
-----------------------------------------------------------------------

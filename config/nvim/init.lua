require("marc.options")
require("marc.packer")
require("marc.remap")

require("telescope").load_extension("git_worktree")
require("telescope").load_extension("file_browser")
require("telescope").load_extension('cder')
require("telescope").load_extension("dir")

require("oil").setup()

require("todo-comments").setup()
require("flash").setup( {
    opts = {}, -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  }
)

-- DOING THIS BECAUSE WE GOT 
-- Spawning the language server with cmd: lua-language-server failed. 
-- The language server is not either installed, missing the path or not executable.
-- source: https://github.com/williamboman/nvim-lsp-installer/discussions/509
require("mason").setup({
    PATH = "prepend", -- "skip" seems to cause the spawning error
})

-- empty setup using defaults
require("nvim-tree").setup()

require('lualine').setup()

-- for 'indentation blank lines' (i.e vertical gray lines to show indent lvls)
-- require("ibl").setup() -- to thick and white-ish...

-- for easy motion like (and better) behavior 
-- require('leap').add_default_mappings()

-- DEBUGGER
require("dapui").setup()
require('dap-python').setup('~/.pyenv/versions/debugpy/bin/python')
-- require('nvim-dap-repl-highlights').setup()

require('gitsigns').setup {
    signs = {  
        add          = { text = '+' },
        change       = { text = '^' },
        delete       = { text = 'x' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm = {
        enable = false
    },

    -- KEYMAP SECTION
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk)
        map('n', '<leader>hr', gs.reset_hunk)
        map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}



-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- FOR FLOATING WINDOW WITH PROJECT NAME
-- Create a new highlight group
vim.api.nvim_exec("highlight MyLargeFont guifg=#ffffff guibg=#333333 gui=bold", false)
-- Update the winhl option to use this new highlight group
-- vim.api.nvim_win_set_option(win, 'winhl', 'Normal:MyLargeFont')

-- LOCAL LEADER 
-- the localleader is a variable that provides a
-- way to define custom key mappings in a buffer-local
-- context. It allows users to create mappings that are
-- specific to a particular filetype or buffer.
-- ex: we could have   ,r     to run python files...
vim.g.maplocalleader = ','


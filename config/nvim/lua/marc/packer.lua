-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    -- FILE EXPLORATION: Start
    -- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    -- TELESCOPE
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- TELESCOPE SORTER 
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    -- TELESCOPE FILE BROWER (to be able to search and land in dirs)
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
   
    -- OIL
    use {
        'stevearc/oil.nvim',
        config = function() require('oil').setup() end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }   
    
    -- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    -- FILE EXPLORATION: End
    -- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    -- COLOR-THEME: Catpuccin of course

    -- MY CHOICE 
    use { "catppuccin/nvim", as = "catppuccin" }


    -- TREE-SITTER
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,}

    -- TREE-SITTER PLAYGROUND
    -- Gives access to the entire AST of the code 
    -- with ':TSPlaygroundToggle
    use('nvim-treesitter/playground')

    -- HARPOON (for file navigation)
    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    -- GIT pluggins
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')
    use('ThePrimeagen/git-worktree.nvim')
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    --  LSP ZERO (linting, autocompletion, debugger...)
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    -- MARC ADD: for databases etc... 
    -- Ass seen on: https://www.youtube.com/watch?v=NhTPVXP8n7w
    use {'tpope/vim-dadbod'}
    use {'kristijanhusak/vim-dadbod-ui'}
    use {'kristijanhusak/vim-dadbod-completion'}
   
    use {'tpope/vim-commentary'}


    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    
    
    -- STATUS BAR FOR NVIM
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- Embed your vim statusline in the tmux statusline!
    use 'vimpostor/vim-tpipeline'
    
    -- MARC ADD: easymotion for neovim
    use {
        'ggandor/leap.nvim',
        requires = { {'tpope/vim-repeat'} }
    }

    -- trigger: s   
    -- 'sab' will move the cursor to the first occurence of 'ab'
    -- use 'justinmk/vim-sneak'

    -- MARC ADD: another easymotion like plugging
    -- use {
    --     'phaazon/hop.nvim',
    --     branch = 'v2', -- optional but strongly recommended
    --     config = function()
    --         -- you can configure Hop the way you like here; see :h hop-config
    --         require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    --     end

    -- }

    -- For notes & zettelkasten
    use 'vimwiki/vimwiki'

    -- email in nimv !!! (requires soywood/himalaya cli installed)
    use "https://git.sr.ht/~soywod/himalaya-vim"

    use "lukas-reineke/indent-blankline.nvim"

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    
    use "christoomey/vim-tmux-navigator"

    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end 
    }
    end)

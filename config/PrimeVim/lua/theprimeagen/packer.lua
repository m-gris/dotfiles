-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- TELESCOPE
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- TELESCOPE SORTER 
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }


    -- COLOR-THEME: ROSE-PINE

    use({ 
        'rose-pine/neovim', 
        as = 'rose-pine',
        config = function() 
            vim.cmd('colorscheme rose-pine')
        end
    })

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

        -- GIT pluggin
        use('tpope/vim-fugitive')


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

        use {'tpope/vim-commentary'}
        --
        -- MARC ADD: easymotion for neovim
        -- trigger: s   
        -- 'sab' will move the cursor to the first occurence of 'ab'
        use 'justinmk/vim-sneak'

        -- MARC ADD: another easymotion like plugging
        use {
            'phaazon/hop.nvim',
            branch = 'v2', -- optional but strongly recommended
            config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            end
        }
    end)

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

    -- OIL (to manipulate file systems like text
    -- i.e delete a file with 'dd' then save with :w
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

    -- COLOR-THEMES
    use { "catppuccin/nvim", as = "catppuccin" }
    use "rebelot/kanagawa.nvim"
    -- Melange was designed with one idea in mind:
    -- Control flow should use warm colors
    -- and data should use cold colors;
    use "savq/melange-nvim"
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use "EdenEast/nightfox.nvim"
    use "romainl/Apprentice"


    -- PYTHON VIRTUAL ENV SWITCHER
    use 'AckslD/swenv.nvim'

    -- TREE-SITTER
    use {
        'nvim-treesitter/nvim-treesitter',
        -- IF BREAKING CHANGE... ROLL BACK TO
        -- commit = f636d58c8d5780
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

    -- use "lukas-reineke/indent-blankline.nvim"

    use "akinsho/toggleterm.nvim"

    use "christoomey/vim-tmux-navigator"

    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }

    -- FOR MARKDOWN PREVIEW
    --  COMMENTED => check if conflict with something else
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = function() vim.fn["mkdp#util#install"]() end,
    -- })
    -- use "masukomi/vim-markdown-folding"

    -- use {
    --     -- displays a popup with possible keybindings
    --     -- of the command you started typing
    --     "folke/which-key.nvim",
    --     config = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 2000
    --         require("which-key").setup {
    --             -- your configuration comes here
    --             -- or leave it empty to use the default settings
    --             -- refer to the configuration section below
    --         }
    --     end
    -- }


    -- use GX to open links (URLs, github, brewfiles etc...)
    use {
        "chrishrb/gx.nvim",
        event = "BufEnter",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gx").setup {
                open_browser_app = "open",
                open_browser_args = { "--background" },
                handlers = {
                    plugin = true,
                    github = true,
                    brewfile = true,
                    package_json = true,
                    search = true,
                },
                handler_options = {
                    search_engine = "google",
                },
            }
        end
    }

    -- search text on the web
    -- :BrowserSearch
    -- custom binding:  <learder>w
   use 'voldikss/vim-browser-search'


   -- @@@ RANGER PLUGINS - Start
   use {
       'francoiscabrol/ranger.vim',
       requires = { {'rbgrouleff/bclose.vim'} }
   }

   use "kevinhwang91/rnvimr"
   -- @@@ RANGER PLUGINS - End

   -- @@@@@ PROJECT MANAGEMENT @@@@@@@@@@@@@@@
   -- STARTIFY => "PROJECT Management for vim" (recent files etc...)
   -- use 'mhinz/vim-startify'
    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
}
   -- #######################################

    -- @@@@@@@@@@@ NOTEBOOK STYLE
    use {'jpalardy/vim-slime', ft = 'python'} use {'hanschen/vim-ipython-cell', ft = 'python'}


    --- GLOW: for markdown rendering
    use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

    -- DEBUGGER Setup (fomr DevopsToolbox)
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'mfussenegger/nvim-dap-python'
    -- use 'LiadOz/nvim-dap-repl-highlights'


    -- SURROUNDS (quotes, parens etc...)
    use 'machakann/vim-sandwich'

    -- TO CHANGE DIRS WITH TELESCOPE / FZF
    use 'zane-/cder.nvim'
    use({
        "princejoogie/dir-telescope.nvim",
        -- telescope.nvim is a required dependency
        requires = {"nvim-telescope/telescope.nvim"},
        config = function()
            require("dir-telescope").setup({
                -- these are the default options set
                hidden = true,
                no_ignore = false,
                show_preview = true,
            })
        end,
    })

    -- FOR CSV PREVIEW
    -- use 'mechatroner/rainbow_csv'
    -- use 'chrisbra/csv.vim'
    use 'VidocqH/data-viewer.nvim'
    use 'dhruvasagar/vim-table-mode'

    -- FOR DOCUMENTATIONS
    use 'rizzatti/dash.vim'

    -- SC-IM  (only for markdown in VIM for now, not csv etc...)
    use 'mipmip/vim-scimark'


    -- FOR CLOJURE
    use 'Olical/conjure'
    -- Structural editing, optional
    use 'guns/vim-sexp'
    use 'tpope/vim-sexp-mappings-for-regular-people'
    use 'tpope/vim-repeat'


    -- TODOS highlighs etc...
    use({
        'folke/todo-comments.nvim',
        requires = {'nvim-lua/plenary.nvim'},
    })

    use ({"folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
 })

   -- AUTOSAVING
   use({
	"Pocco81/auto-save.nvim",
	config = function()
		 require("auto-save").setup {
			-- your config goes here
			-- or just leave it empty :)
		 }
	end,
})

    -- USEFULL Paired-mappings by T-Popehttps://github.com/
    use 'tpope/vim-unimpaired'

    -- --
    use 'folke/flash.nvim'
    -- -- easymotion for neovim
    -- use {
        --     'ggandor/leap.nvim',
        --     requires = { {'tpope/vim-repeat'} }
        -- }

    -- TO VIEW DEFINITION (HOVER...)
    use({
        "dnlhc/glance.nvim",
        config = function()
            require('glance').setup({
                -- your configuration
            })
        end,
    })
    
    -- @@@@@@@ ZEN / FOCUS MODE PLUGINS - Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    use 'junegunn/goyo.vim'
    use 'pocco81/true-zen.nvim'
    use 'folke/zen-mode.nvim'
    -- use {"shortcuts/no-neck-pain.nvim", tag = "*" }
    -- @@@@@@@ ZEN / FOCUS MODE PLUGINS - End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    
    -- @@@@@@ DIFFING - Start @@@@@@@@@@@@@@@@@@
    -- 1 ) To compare files "in general"
    use({
    "jemag/telescope-diff.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    }
  })
  -- 2) for GIT in particular
  use "sindrets/diffview.nvim"


  -- 3) for directories 
  use "will133/vim-dirdiff"
    -- @@@@@@ DIFFING - End @@@@@@@@@@@@@@@@@@
    

    -- @@@@@ FOLDS @@@@@@@@@@
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    -- use {
    --     "chrisgrieser/nvim-origami",
    --     config = function () 
    --         require("origami").setup ({}) -- setup call needed
    --     end,
    -- }

    use { 'anuvyklack/fold-preview.nvim',
    requires = 'anuvyklack/keymap-amend.nvim',
    config = function()
        require('fold-preview').setup({
            auto=1000
            -- Your configuration goes here.
        })
    end
}   
    -- ######################

    -- @@@@ YAML @@@@

    use { "dapc11/telescope-yaml.nvim", 
         dependencies = { "nvim-telescope/telescope.nvim" } 
     }
    
    use {"cuducos/yaml.nvim",}
        -- ft = { "yaml" }, -- optional
        -- requires = {
        --     "nvim-treesitter/nvim-treesitter",
        --     "nvim-telescope/telescope.nvim" -- optional
        -- }
    -- } 



end)

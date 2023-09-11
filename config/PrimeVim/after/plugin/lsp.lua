-- NOTA BENE 
-- THEPRIMEAGEN ADDED QUITE A FEW THINGS HERE
-- I DIDN"T... (Rust, Typescript stuff)
-- STILL LOOK BACK AT THIS VIDEO
-- VIM Zero to LSP from Scratch
-- https://youtu.be/w7i4amO_zaE?t=1202
-- TO TAKE INSPIRATION WHEN SETTING UP FOR PYTHON .. 
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

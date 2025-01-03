local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {"Everblush/nvim", name = "everblush", priority = 1000, config = function() vim.cmd('colorscheme everblush') end},
  {"nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { "nvim-lua/plenary.nvim" }},
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {"theprimeagen/harpoon"},
  {"mbbill/undotree"},
  {"tpope/vim-fugitive"},
  --- Uncomment the two plugins below if you want to manage the language servers from neovim
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  {'itchyny/lightline.vim'}
})

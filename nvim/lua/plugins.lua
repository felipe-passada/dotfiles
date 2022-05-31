-- Install packer
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

-- Runs packer when the plugins.lua changes
 vim.cmd [[packadd packer.nvim]]
 vim.api.nvim_exec([[
  augroup Packer
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
 ]], false)

 -- User a protected call so we dont get an error out on first use
 local status_ok, packer = pcall(require, "packer")
 if not status_ok then
    return
  end

function get_setup(name)
  return string.format('require("plugins/%s")', name)
end

  local use = require('packer').use
  require('packer').startup(function ()
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
    use {'morhetz/gruvbox'}
    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/gitsigns.nvim'
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use {
     'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons',},
      config = function() require'nvim-tree'.setup {} end
    }
    -- Completion plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
   -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use 'nvim-treesitter/nvim-treesitter'
    use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'
    use "jose-elias-alvarez/null-ls.nvim"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
  end)


require("plugins/lualine")

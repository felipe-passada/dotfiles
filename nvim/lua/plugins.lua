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
    use 'folke/tokyonight.nvim'
    use 'nvim-lua/plenary.nvim'
    use {'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-treesitter/nvim-treesitter'
  end)

require("plugins/lualine")

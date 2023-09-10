--local execute = vim.api.nvim_command
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

local lazy_status, lazy = pcall(require, "lazy")

if not lazy_status
  then
    print("error while requiring lazy")
    return;
end
vim.g.mapleader = " "
lazy.setup({{import = "fpassada.plugins"}, {import  = "fpassada.plugins.lsp"}}, {
  install = {
    colorscheme = { "catppuccin" },
  },
  checker = {
    enabled = true,
    notify = false
  },
  change_detection = {
    notify = false
  }
})

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag"
  },

  config  = function()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    configs.setup {
      ensure_installed = {
        "lua",
        "typescript",
        "javascript",
        "python",
        "css",
        "scss",
        "html",
        "kotlin",
        "go"
      },
      sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
      ignore_install = { "" }, -- List of parsers to ignore installing
      autopairs = { enable = true },
      autotage = { enable = true },
      -- rainbow = {
      --   enable = true,
      --   extend_mode = true,
      --   max_file_lines = 5000
      -- },
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    }
  end
}

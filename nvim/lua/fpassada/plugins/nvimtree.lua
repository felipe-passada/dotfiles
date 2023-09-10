return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    local nvimtree = require("nvim-tree")

    -- documentation recommend config
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1


    nvimtree.setup({
      disable_netrw = true,
      hijack_netrw = true,
      open_on_tab = false,
      hijack_cursor = false,
      update_cwd = true,
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      system_open = {
        cmd = nil,
        args = {},
      },
      filters = {
        dotfiles = false,
        custom = {'^[.env, .env.example, .dockerignore, .gitignore]$'},
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 500,
      },
      view = {
        width = 30,
        hide_root_folder = false,
        side = "left",
        number = false,
        relativenumber = false,
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false,
          },
        },
      },

    })

    local keymap = vim.keymap

    -- NvimTree Keymaps
    keymap.set('n', '<leader>t',':NvimTreeToggle<cr>', { desc = "Toggle file explorer" })
    keymap.set('n', '<leader>r',':NvimTreeRefresh<cr>', { desc = "Refresh file explorer" })
    keymap.set('n', '<leader>f',':NvimTreeFindFile<cr>', { desc = "Toggle file explorer on current file" })
  end
}

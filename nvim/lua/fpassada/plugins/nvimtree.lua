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
      renderer = {
        icons = {
          glyphs = {
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              deleted = "",
              untracked = "U",
              ignored = "◌",
            }
          }
        }
      }

    })
    -- FIX: edit_or_open and vslpit not working properly needs maybe a debug and understand why its remaping vim navigation
    --[[ local api = require("nvim-tree.api")

    local function edit_or_open()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
      else
        -- open file
        api.node.open.edit()
        -- Close the tree if file was opened
        api.tree.close()
      end
    end

    -- open as vsplit on current node
    local function vsplit_preview()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
      else
        -- open file as vsplit
        api.node.open.vertical()
      end

      -- Finally refocus on tree if it was lost
      api.tree.focus()
    end ]]

    local keymap = vim.keymap

    -- NvimTree Keymaps
    keymap.set('n', '<leader>t',':NvimTreeToggle<cr>', { desc = "Toggle file explorer" })
    keymap.set('n', '<leader>r',':NvimTreeRefresh<cr>', { desc = "Refresh file explorer" })
    keymap.set('n', '<leader>f',':NvimTreeFindFile<cr>', { desc = "Toggle file explorer on current file" })
    -- on_attach
    -- FIX: not working properly navigation inside buffer stop working when i set to nvim-tree
    -- keymap.set('n', 'l', edit_or_open, opts)
    -- keymap.set('n', 'L', vsplit_preview, opts)
    -- keymap.set('n', 'h', api.node.navigate.parent_close, opts)
    -- keymap.set('n', 'H', api.tree.collapse_all, opts)
  end
}

return {
  "nvim-telescope/telescope.nvim", tag = "0.1.2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons"
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      }
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap

    keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>", { silent=true , desc = 'Find Files'})
    keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", { silent = true, desc = 'Find using grep'})
    keymap.set('n', '<leader>fw', "<cmd>Telescope grep_string<cr>", { silent = true, desc = 'Find word using grep'})
    keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<cr>", { silent = true , desc = 'Show buffers'})
    keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", { silent = true , desc = 'Help tags'})
    keymap.set('n', '<leader>ch', "<cmd>Telescope keymaps<cr>", { silent = true , desc = 'Keymaps cheatsheet'})
    keymap.set('n', '<leader>fr', "<cmd>Telescope registers<cr>", { silent = true , desc = 'Show registers'})
  end
}

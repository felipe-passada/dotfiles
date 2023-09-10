return {
  'lewis6991/gitsigns.nvim',

  config = function ()
    local status_ok, gitsigns = pcall(require, "gitsigns")
    if not status_ok then
      return
    end

    gitsigns.setup {
      signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter_opts = {
        relative_time = false,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    }

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk, "Stage hunks")
      map('n', '<leader>hr', gs.reset_hunk, "Reset hunks")
      map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "Stage hunks visual mode")
      map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "Reset hunks visual mode")
      map('n', '<leader>hS', gs.stage_buffer, "Stage buffer")
      map('n', '<leader>hu', gs.undo_stage_hunk, "Undo stage hunk")
      map('n', '<leader>hR', gs.reset_buffer, "Reset buffer")
      map('n', '<leader>hp', gs.preview_hunk, "Preview hunk")
      map('n', '<leader>hb', function() gs.blame_line{full=true} end, "Toggle git blame")
      map('n', '<leader>tb', gs.toggle_current_line_blame,  "Toggle git blame current line")
      map('n', '<leader>hd', gs.diffthis, "Toggle git diff")
      map('n', '<leader>hD', function() gs.diffthis('~') end, "Toggle git diff")
      map('n', '<leader>td', gs.toggle_deleted, "Toggle git delete")

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end


  end
}
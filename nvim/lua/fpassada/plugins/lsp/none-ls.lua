return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.gofumpt.with({
          command = "~/go/bin/gofumpt"
        }),
        null_ls.builtins.formatting.goimports_reviser.with({
          command = "~/go/bin/gofumpt"
        })
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}

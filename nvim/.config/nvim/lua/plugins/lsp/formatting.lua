return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        json = { "prettier" },
        yaml = { "prettier" },
        toml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        lua = { "stylua" },
        javascript = { "prettier_js" },
        javascriptreact = { "prettier_js" },
        typescript = { "prettier_js" },
        typescriptreact = { "prettier_js" },
        python = { "ruff_format", "ruff_organize_imports" },
        go = { "gofmt" },
      },
      formatters = {
        prettier = {},
        prettier_js = {
          command = "prettier",
          stdin = true,
          args = { "--stdin-filepath", "$FILENAME" },
          prepend_args = { "--tab-width", "2", "--use-tabs", "false", "--print-width", "120" },
        },
      },
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = false,
      --   timeout_ms = 500,
      -- },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        -- async = false,
        timeout_ms = 3000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}

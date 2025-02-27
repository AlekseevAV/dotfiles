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
        lua = { "stylua" },
        javascript = { "prettier" },
        -- python = { "black", "isort" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
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
    end, { desc = "Fromat file or range (in visual mode)" })
  end,
}

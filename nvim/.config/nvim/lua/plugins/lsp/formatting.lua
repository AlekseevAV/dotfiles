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
        -- python = function(bufnr)
        --   if require("conform").get_formatter_info("ruff_format", bufnr).available then
        --     return { "ruff_format" }
        --   else
        --     return { "isort", "black" }
        --   end
        -- end,
        python = { "black", "isort" },
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

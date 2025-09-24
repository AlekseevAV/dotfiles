return {
  -- Empty setup for nvim-lspconfig with native lspconfig usage
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    vim.diagnostic.config({
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
      float = { border = "rounded" },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspKeymaps", {}),
      callback = function(ev)
        local function opts(desc)
          return { buffer = ev.buf, silent = true, desc = desc }
        end

        local map = vim.keymap.set
        map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts("Find references"))
        map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
        map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts("Go to definition"))
        map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts("Go to implementation"))
        map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts("Go to type definition"))
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
        map("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
        map("n", "<leader>df", "<cmd>Telescope diagnostics bufnr=0<CR>", opts("Buffer diagnostics"))
        map("n", "<leader>dd", vim.diagnostic.open_float, opts("Line diagnostics"))
        map("n", "[d", vim.diagnostic.goto_prev, opts("Previous diagnostic"))
        map("n", "]d", vim.diagnostic.goto_next, opts("Next diagnostic"))
        map("n", "K", vim.lsp.buf.hover, opts("Hover documentation"))
        map("n", "<leader>rs", "<cmd>LspRestart<CR>", opts("Restart LSP"))
      end,
    })

    local cmp_cap = require("cmp_nvim_lsp").default_capabilities()
    local caps = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), cmp_cap)
    caps.offsetEncoding = { "utf-16" }

    vim.lsp.config.lua_ls = {
      capabilities = caps,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    vim.lsp.config.pyright = {
      capabilities = caps,
    }

    vim.lsp.config.ruff = {
      capabilities = caps,
      on_init = function(client, _)
        client.offset_encoding = "utf-16"
      end,
    }

    vim.lsp.enable({
      "lua_ls",
      "pyright",
      "ruff",
    })
  end,
}

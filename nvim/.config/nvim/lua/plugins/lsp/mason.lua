return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
      },
      automatic_installation = true,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "prettier",
      },
      run_on_start = true,
    })
  end,
}

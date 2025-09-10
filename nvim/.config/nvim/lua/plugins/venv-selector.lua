return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "ibhagwan/fzf-lua",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python", --optional
  },
  lazy = false,
  keys = {
    { "<leader>vs", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" },
  },
  opts = {
    options = {
      picker = "fzf-lua",
    },
  },
}

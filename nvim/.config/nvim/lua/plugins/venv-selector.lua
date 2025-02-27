return {
  "stefanboca/venv-selector.nvim",
  branch = "sb/push-rlpxsqmllxtz",
  dependencies = {
    "ibhagwan/fzf-lua",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
  },
  lazy = false,
  keys = {
    { "<leader>vs", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" },
  },
  config = function()
    require("venv-selector").setup({
      settings = {
        options = {
          picker = "fzf-lua",
        },
      },
    })
  end,
}

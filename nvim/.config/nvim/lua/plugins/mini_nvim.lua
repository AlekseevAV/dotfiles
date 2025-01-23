return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.ai").setup()
    require("mini.comment").setup()
    require("mini.cursorword").setup()
    require("mini.surround").setup()
    require("mini.operators").setup()
    require("mini.pairs").setup()
    require("mini.bracketed").setup()
    require("mini.hipatterns").setup()
    require("mini.icons").setup()
    -- require("mini.completion").setup()
    require("mini.notify").setup()
    require("mini.tabline").setup()
    require("mini.trailspace").setup()
    require("mini.move").setup({
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = "<C-M-h>",
        right = "<C-M-l>",
        down = "<C-M-j>",
        up = "<C-M-k>",

        -- Move current line in Normal mode
        line_left = "<C-M-h>",
        line_right = "<C-M-l>",
        line_down = "<C-M-j>",
        line_up = "<C-M-k>",
      },
    })
    require("mini.indentscope").setup({ draw = {
      animation = function()
        return 0
      end,
    } })
  end,
}

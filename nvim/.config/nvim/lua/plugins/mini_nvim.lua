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
    require("mini.indentscope").setup({ draw = {
      animation = function()
        return 0
      end,
    } })
  end,
}

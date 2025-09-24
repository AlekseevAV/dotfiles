return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.ai").setup()
    require("mini.comment").setup()
    require("mini.cursorword").setup()
    require("mini.surround").setup({
      custom_surroundings = {
        ["("] = { output = { left = "(", right = ")" } },
        [")"] = { output = { left = "(", right = ")" } },
        ["["] = { output = { left = "[", right = "]" } },
        ["]"] = { output = { left = "[", right = "]" } },
        ["{"] = { output = { left = "{", right = "}" } },
        ["}"] = { output = { left = "{", right = "}" } },
        ["<"] = { output = { left = "<", right = ">" } },
        [">"] = { output = { left = "<", right = ">" } },
      },
    })
    require("mini.operators").setup()
    require("mini.pairs").setup()
    require("mini.bracketed").setup()
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
        legacy = { pattern = "%f[%w]()LEGACY()%f[%W]", group = "MiniHipatternsFixme" },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
    require("mini.icons").setup()
    -- require("mini.completion").setup()
    require("mini.align").setup()
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

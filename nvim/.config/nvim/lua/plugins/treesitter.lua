return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({
      modules = {},
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      -- enable syntax highlighting
      highlight = {
        enable = true,
        -- disable treesitter for large files
        disable = function(lang, bufnr) --
          -- Extend this to other languages by adding `lang == "x"` where x is the language
          return vim.api.nvim_buf_line_count(bufnr) > 50000
        end,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "go",
        "python",
        "helm",
        "toml",
        "sql",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- save jumps on every movement
          goto_next_start = {
            ["]a"] = "@parameter.inner",
          },
          goto_previous_start = {
            ["[a"] = "@parameter.inner",
          },
        },
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
          },
        },
      },
    })
  end,
}

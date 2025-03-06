return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Fuzzy find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Fuzzy find help tags" },
    { "<leader>fg", "<cmd>Telescope git_status<cr>", desc = "Fuzzy find git status" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
    { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
    {
      "<leader>fv",
      function()
        local search_dirs = { "node_modules" }
        local current_venv = vim.fn.getenv("VIRTUAL_ENV")
        if current_venv == nil then
          -- add default venv path
          table.insert(search_dirs, ".venv/lib")
        else
          -- add current venv path
          table.insert(search_dirs, current_venv .. "/lib")
        end
        require("telescope.builtin").live_grep({
          search_dirs = search_dirs,
          file_ignore_patterns = {},
          additional_args = function()
            return { "--no-ignore", "--hidden" }
          end,
        })
      end,
      desc = "Find string in virtualenv and node_modules",
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").live_grep({
          search_dirs = { vim.fn.expand("%:p:h") },
        })
      end,
      desc = "Find string in current file directory",
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        vimgrep_arguments = {
          "rg",
          "--follow", -- Follow symbolic links
          "--hidden", -- Search for hidden files
          "--no-heading", -- Don't group matches by each file
          "--with-filename", -- Print the file path with the matched lines
          "--line-number", -- Show line numbers
          "--column", -- Show column numbers
          "--smart-case", -- Smart case search
        },
        file_ignore_patterns = { "node_modules/", ".git/", ".idea/", ".venv/", ".obsidian/" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        live_grep = {
          additional_args = function(_)
            return { "--hidden" }
          end,
        },
        find_files = {
          hidden = true,
        },
        lsp_references = {
          include_declaration = false,
          trim_text = true,
          show_line = false,
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}

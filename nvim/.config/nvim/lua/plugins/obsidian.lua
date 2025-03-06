return {
  "AlekseevAV/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "vault",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/exness",
      },
    },
    notes_subdir = "inbox",
    new_notes_location = "notes_subdir",

    daily_notes = {
      folder = "notes/dailies",
      date_format = "%Y-%m-%d",
      default_tags = { "daily-notes" },
    },

    disable_frontmatter = true,

    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },
  },

  keys = {
    { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Select Template" },
    { "<leader>on", "<cmd>ObsidianToday<cr>", desc = "Open Today Note" },
    {
      "<leader>of",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "< Find In Notes >",
          cwd = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/exness",
        })
      end,
      desc = "Find Notes",
    },
    {
      "<leader>os",
      function()
        require("telescope.builtin").live_grep({
          prompt_title = "< Search In Notes >",
          cwd = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/exness",
        })
      end,
      desc = "Search Notes",
    },
    {
      "<leader>oo",
      function()
        local fullPath = vim.api.nvim_buf_get_name(0) -- /home/hs/wiki/xxxxx
        local wikipath = string.sub(fullPath, 15)
        local uri = ("obsidian://open?vault=wiki&file=%s"):format(wikipath)
        vim.fn.jobstart("xdg-open" .. " '" .. uri .. "'")
      end,
      desc = "Open in Obsidian",
    },
  },
}

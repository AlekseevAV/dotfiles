return {
  "epwalsh/obsidian.nvim",
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
        path = "/Users/aleksandr.alekseev/Library/Mobile Documents/iCloud~md~obsidian/Documents/vault_1",
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
}

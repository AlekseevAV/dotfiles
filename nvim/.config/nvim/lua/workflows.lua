local keymap = vim.keymap -- for conciseness

-- search for files in config
keymap.set(
  "n",
  "<leader>cf",
  ":Telescope find_files hidden=true cwd=~/work/other/dotfiles<cr>",
  { desc = "Search config files" }
)

-- OTHER
-- format ChatGPT output to markdown
keymap.set(
  "n",
  "<leader>gf",
  ":%s/\\t//g | %s/^\\(\\d*\\)\\./\\1. /g | %s/•/- /g<cr>",
  { desc = "Format ChatGPT output to markdown" }
)

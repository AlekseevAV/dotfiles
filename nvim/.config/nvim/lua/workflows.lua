local keymap = vim.keymap -- for conciseness

-- search for files in config
keymap.set(
  "n",
  "<leader>cf",
  ":Telescope find_files cwd=/Users/aleksandr.alekseev/ search_dirs={'.config/nvim','.scripts','.tmux.conf','.zshrc','.wezterm.lua'}<cr>",
  { desc = "Search config files" }
)

-- OBSIDIAN
-- navigate to vault
keymap.set(
  "n",
  "<leader>oo",
  ":cd /Users/aleksandr.alekseev/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/vault_1<cr>",
  { desc = "Go to Obsidian vault" }
)
-- convert note to template and remove leading white space
keymap.set(
  "n",
  "<leader>on",
  ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>",
  { desc = "Convert current file to template" }
)
-- strip date from note title and replace dashes with spaces
-- must have cursor on title
keymap.set("n", "<leader>op", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>", { desc = "Strip date from note title" })
-- search for files in full vault
keymap.set(
  "n",
  "<leader>of",
  ':Telescope find_files search_dirs={"/Users/aleksandr.alekseev/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/vault_1/notes"}<cr>',
  { desc = "Search for files in vault" }
)
keymap.set(
  "n",
  "<leader>os",
  ':Telescope live_grep search_dirs={"/Users/aleksandr.alekseev/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/vault_1/notes"}<cr>',
  { desc = "Search for string in vault" }
)

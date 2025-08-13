return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({
      diff_binaries = false, -- Show diffs for binaries
      use_icons = true,
    })

    -- Define a function to get the default branch name
    local function get_default_branch_name()
      local res = vim.system({ "git", "rev-parse", "--verify", "main" }, { capture_output = true }):wait()
      return res.code == 0 and "main" or "master"
    end

    vim.keymap.set("n", "<leader>dvh", "<cmd>DiffviewFileHistory<cr>", { desc = "Repo history" })
    vim.keymap.set("n", "<leader>dvf", "<cmd>DiffviewFileHistory --follow %<cr>", { desc = "File history" })
    vim.keymap.set("v", "<leader>dvl", "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>", { desc = "Range history" })
    vim.keymap.set("n", "<leader>dvl", "<Cmd>.DiffviewFileHistory --follow<CR>", { desc = "Line history" })
    vim.keymap.set("n", "<leader>dvd", "<cmd>DiffviewOpen<cr>", { desc = "Repo diff" })
    vim.keymap.set("n", "<leader>dvc", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" })

    -- Diff against local master/main branch
    vim.keymap.set("n", "<leader>dvm", function()
      vim.cmd("DiffviewOpen " .. get_default_branch_name())
    end, { desc = "Diff against master/main" })

    -- Diff against remote master/main branch
    vim.keymap.set("n", "<leader>dvM", function()
      vim.cmd("DiffviewOpen HEAD..origin/" .. get_default_branch_name())
    end, { desc = "Diff against origin/master" })
  end,
}

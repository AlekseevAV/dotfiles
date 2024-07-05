return {
  "catppuccin/nvim",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}

-- Tokyonight
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function ()
--     require("tokyonight").setup({
--       transparent = true,
--       styles = {
--          sidebars = "transparent",
--          floats = "transparent",
--       },
--     })
--     vim.cmd.colorscheme "tokyonight"
--   end
-- }

return {
  "stevearc/oil.nvim",
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons"},
  lazy = false,
  keys = {
    {"-","<cmd>Oil<cr>", mode = "n", desc = "Open parent directory "},
  },
  config = true,
}

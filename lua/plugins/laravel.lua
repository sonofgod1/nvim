return {
  "adalessa/laravel.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
  },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  keys = {
    { "<leader>la", ":Laravel artisan<cr>", desc = "Laravel Application Commands" },
    { "<leader>lr", ":Laravel routes<cr>",  desc = "Laravel Application Routes" },
    {
      "<leader>lt",
      function()
        require("laravel.tinker").send_to_tinker()
      end,
      mode = "v",
      desc = "Laravel Application Routes",
    },
  },
  event = { "VeryLazy" },
  config = true,
}

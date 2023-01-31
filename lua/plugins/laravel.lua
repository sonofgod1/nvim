return {
    "adalessa/laravel.nvim",
    dependencies = {
        "rcarriga/nvim-notify",
        "nvim-telescope/telescope.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm" },
    keys = {
        { "<leader>pa", ":Artisan<cr>" },
    },
    events = { "VeryLazy" },
    config = function()
        require("laravel").setup()
        require("telescope").load_extension("laravel")
    end
}

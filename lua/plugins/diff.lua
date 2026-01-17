return {
  "jemag/telescope-diff.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("telescope").load_extension("diff")
    vim.keymap.set("n", "<leader>dc", function()
      require("telescope").extensions.diff.diff_current({ hidden = true })
    end, { desc = "Comparar archivo actual" })

    vim.keymap.set("n", "<leader>df", function()
      require("telescope").extensions.diff.diff_files({ hidden = true })
    end, { desc = "Comparar archivos" })
  end,
}

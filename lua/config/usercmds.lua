vim.api.nvim_create_autocmd("FileType", {
  pattern = "blade",
  callback = function()
    vim.treesitter.start(vim.api.nvim_get_current_buf(), "blade")
    -- Forzar highlight si no está activo
    local buf = vim.api.nvim_get_current_buf()
    if not vim.treesitter.highlighter.active[buf] then
      vim.treesitter.highlighter.attach(buf, "blade")
    end
  end,
})

vim.cmd [[colorscheme tokyonight-night]]

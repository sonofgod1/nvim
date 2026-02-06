return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Intenta cargar nvim-treesitter.configs solo si ya está instalado
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      -- En el primer arranque, el plugin aún no existe → silenciar error
      return
    end

    configs.setup({
      ensure_installed = { "blade", "php", "html", "css" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end,
  event = { "BufReadPost", "BufNewFile" },
}

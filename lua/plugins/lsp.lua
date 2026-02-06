return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
        },
      },
    },
    "folke/neodev.nvim",
    {
      "williamboman/mason-lspconfig.nvim",
      version = "~1.0",
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = { "lua_ls" }
        })
      end
    },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  event = "VeryLazy",
  main = "alpha.lsp",
}

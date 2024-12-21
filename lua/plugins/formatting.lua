return{
  "Stevearc/conform.nvim",
  event = { "BufReadPre","BufNewFile"},
  config = function()
    local conform = require("conform");

      conform.setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          php = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 2500,
      },
    })

    vim.keymap.set({"n", "v"}, "<leader>mp",function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 2500,
      })
    end, { desc = "Format file or range (in visual mode)"})
  end,
}

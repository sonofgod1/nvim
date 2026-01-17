local lsp_attach = require "alpha.lsp.attach"
local lsp_flags = require "alpha.lsp.flags"

return function(ops)
  local config = {
    on_attach = lsp_attach,
    flags = lsp_flags,
    filetypes = { "python", "xml", "javascript", "css" },
    root_dir = require('lspconfig.util').root_pattern('__manifest__.py', '__openerp__.py'),
    single_file_support = true,
  }

  -- Usar el binario local de odoo_ls
  config.cmd = { "/home/jonaodoo/.local/share/nvim/odoo/odoo_ls_server" }

  return vim.tbl_extend("force", config, ops)
end

require "config"
require "alpha.globals"

-- Definir el servidor LSP personalizado
local function setup_odoo_ls()
  -- Solo si no está ya configurado
  if vim.lsp.get_active_clients({ name = "odoo_ls" })[1] then
    return
  end

  local config = {
    name = "odoo_ls",
    cmd = {
      "/home/jonaodoo/.local/share/nvim/odoo/odoo_ls_server",
      "--config-path",
      "/home/jonaodoo/dev/odoo/jufusa18/docker-odoo-dev/odools.toml",
    },
    root_dir = "/home/jonaodoo/dev/odoo/jufusa18/docker-odoo-dev",
    settings = {
      Odoo = {
        selectedProfile = "main",
      },
    },
    filetypes = { "python", "xml" },
    on_attach = function(client, bufnr)
      -- Opcional: agrega mappings, etc.
    end,
  }

  -- Iniciar el LSP para el buffer actual si corresponde
  local buf_ft = vim.bo.filetype
  if vim.tbl_contains(config.filetypes, buf_ft) then
    local root = config.root_dir
    if vim.loop.fs_stat(root) then
      vim.lsp.start(config)
    end
  end
end

-- Autocmd para activar en buffers Python/XML
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "xml" },
  callback = function()
    -- Verificar que estamos en el proyecto de Odoo
    local root = "/home/jonaodoo/dev/odoo/jufusa18/docker-odoo-dev"
    if vim.fn.getcwd():find(root, 1, true) == 1 or vim.fn.expand("%:p"):find(root, 1, true) then
      setup_odoo_ls()
    end
  end,
})

local dap = require("dap")

dap.adapters.python = function(callback, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    callback({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    callback({
      type = 'executable',
      command = 'path/to/virtualenvs/debugpy/bin/python',
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    type = 'python',
    request = 'attach',
    name = 'Attach to Odoo',
    connect = {
      host = 'localhost', -- Host desde nvim
      port = '8888',
    },
    pathMappings = {
      {
        localRoot = "/home/jonaodoo/dev/odoo/jufusa18/docker-odoo-dev/src",
        remoteRoot = "/var/lib/odoo/custom_addons"
      },
      {
        localRoot = "/home/jonaodoo/dev/odoo/jufusa18/recursos/odoo/addons",
        remoteRoot = "/var/lib/odoo/odoo/addons"
      }
    },
    justMyCode = false,
  }
}

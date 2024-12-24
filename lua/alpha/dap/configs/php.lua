local dap = require("dap")

dap.adapters.php = {
  type = "executable",
  command = "php-debug-adapter",
  console = "internalConsole",
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Liste for Xdebug",
    port = 9003,
    serverSourceRoot = '/home/vagrant/code/php/pastores',
    localSourceRoot = '/home/jona/code/php/pastores',
    trace = { server = '/home/jona/code/php/pastores/storage/logs/xdebug.log' },
  },
  {
    type = "php",
    request = "launch",
    name = "Symfony",
    port = 9003,
    pathMappings = {
      ["/app"] = "${workspaceFolder}",
    },
  },
}

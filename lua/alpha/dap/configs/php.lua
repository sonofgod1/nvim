local dap = require("dap")

dap.adapters.php = {
  type = "executable",
  command = "php-debug-adapter",
  console = "integratedTerminal",
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "liste for xdebug",
    port = 9003,
    serversourceroot = '/home/vagrant/code/php/pastores',
    localsourceroot = '/home/jona/code/php/pastores',
    trace = { server = '/home/jona/code/php/pastores/storage/logs/xdebug.log' },
  },
  {
    type = "php",
    request = "launch",
    name = "listen for quehare xdebug",
    port = 9003,
    serversourceroot = '/home/vagrant/code/html/quehare',
    localsourceroot = '/home/jona/code/html/quehare',
    trace = { server = '/home/jona/code/html/quehare/xdebug.log' },
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

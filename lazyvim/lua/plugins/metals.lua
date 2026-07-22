return {
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = { "scala", "sbt" },
  opts = function()
    local metals_config = require("metals").bare_config()

    metals_config.init_options.statusBarProvider = "off"

    metals_config.settings = {
      showImplicitArguments = false,
      showImplicitConversionsAndClasses = false,
      showInferredType = false,
      superMethodLensesEnabled = false,
      excludedPackages = {
        "akka.actor.typed.javadsl",
        "org.apache.pekko.actor.typed.javadsl",
        "com.github.swagger.akka.javadsl",
      },
      testUserInterface = "Test Explorer",
      bloopSbtAlreadyInstalled = true,
      bloopJvmProperties = {
        "-Xss4m",
        "-XX:MaxInlineLevel=20",
        "-Xms512M",
        "-Xmx3G",
        "-XX:+UseG1GC",
        "-XX:MaxMetaspaceSize=512M",
      },
      fallbackScalaVersion = "2.13.16",
      serverProperties = {
        "-Xmx8G",
        "-Xms4G",
        "-XX:+UseG1GC",
      },
    }

    metals_config.find_root_dir_max_project_nesting = 3

    metals_config.on_attach = function(client, bufnr)
      require("metals").setup_dap()
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lemminx = {
          settings = {
            xml = {
              fileAssociations = {
                {
                  pattern = "**/*.axaml",
                  systemId = "https:://raw.githubusercontent.com/AvaloniaUI/master/schemas/avaloniaUI.xsd",
                },
              },
            },
          },
        },
      },
    },
  },
}

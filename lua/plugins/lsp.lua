return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {"lua_ls", "rust_analyzer", "pyright", "clangd"},
    },
    dependencies = {
      {"mason-org/mason.nvim", opts = {}},
      "neovim/nvim-lspconfig",
    },
  },

  {
    "neovim/nvim-lspconfig",

    dependencies = {
      {
        "folke/lazydev.nvim", --This allows for lua_lsp to figure out what vim global vars are for nvim config.
        ft = "lua",
        opts = {
          library = {
            {path = "${3rd}/luv/library", words = {"vim%.uv"}}
          },
        },
      },
      "saghen/blink.cmp", --Autocompletion 
    },

    config = function()

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      --Configures clangd lsp
      require("lspconfig").clangd.setup({
        cmd = {
          "clangd",
          "--compile-commands-dir=build",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=never",
          "--completion-style=detailed",
        },
        filetypes = { "c", "cpp" },
      })

      --Configures lua lsp
      require("lspconfig").lua_ls.setup{capabilities = capabilities}

      --Need to fix ada-language-server and fix dependency hell
      --require("lspconfig").ada_ls.setup{}

    end,
  },
}

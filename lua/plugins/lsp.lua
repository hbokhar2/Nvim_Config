return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {"lua_ls", "rust_analyzer", "pyright", "clangd", "ada-language-server"},
    },
    dependencies = {
      {"mason-org/mason.nvim", opts = {}},
      "neovim/nvim-lspconfig",
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
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
    end,
  },
}

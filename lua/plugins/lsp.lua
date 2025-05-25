return {

  --[[Automatically installs LSPs
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {"lua_ls", "clangd"},
    },
    dependencies = {
      {"mason-org/mason.nvim", opts = {}},
      "neovim/nvim-lspconfig",
    },
  }, 

  I want to try not using Mason for a bit. Want to be less dependent on plugins.]]

  -- Defines vim globally for Lua_LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            {path = "${3rd}/luv/library", words = {"vim%.uv"}}
          },
        },
      },
      "saghen/blink.cmp", -- Autocompletion 
    },

    config = function()

      -- Assigns symbols for debugging 
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          spacing = 4,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "H",
          },
          -- Optional: customize highlight groups
          texthl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
          },
        },

        underline = true,
        update_in_insert = false,
        severity_sort = true,

      })

      -- Set diagnostic signs
      local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign"..type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      --Autocompletion
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      --Clang LSP Configuratoin
      require("lspconfig").clangd.setup({
        capabilities = capabilities,

        cmd = {
          "clangd",
          "--compile-commands-dir=build", --Allows for clang to know project build structure.
          '--query-driver=/usr/sbin/gcc,/usr/sbin/g++,/usr/sbin/x86_64-linux-gnu-gcc', --Allows for clang to use compiler paths.
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
        },

        filetypes = { "c", "cpp" },
        init_options = {
          fallbackFlags = {
            "-I/usr/include",
            "-I/usr/include/x86_64-linux-gnu",
            "-I/usr/lib/gcc/x86_64-linux-gnu/12/include"
          }
        }
      })

      require("lspconfig").lua_ls.setup{

        capabilities = capabilities,

      }

    end,
  },
}

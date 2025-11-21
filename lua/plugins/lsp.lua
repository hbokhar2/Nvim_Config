return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("data") .. "/lazy/luv/library"] = true,
            },
          },
        },
      },
      "saghen/blink.cmp", -- Autocompletion 
    },

    config = function()
      -- Diagnostic config
      vim.diagnostic.config({
        float = {
          border = "rounded",
          focusable = false,
          style = "minimal",
          header = "",
          prefix = ""
        },
        virtual_text = { prefix = "●", spacing = 4 },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Set diagnostic signs
      local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Autocompletion capabilities
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- clangd
      vim.lsp.config.clangd = {
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--compile-commands-dir=" .. os.getenv("IBADAH") .. "/HorrorGameCXX/Build",
          "--query-driver=/usr/sbin/gcc,/usr/sbin/g++,/usr/sbin/x86_64-linux-gnu-gcc",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
        },
        filetypes = { "c", "cpp", "h", "hpp" },
        init_options = {
          fallbackFlags = {
            "-I/usr/include",
            "-I/usr/include/x86_64-linux-gnu",
            "-I/usr/lib/gcc/x86_64-linux-gnu/12/include"
          }
        }
      }

      -- CMake LSP
      vim.lsp.config.cmake = {
        cmd = { "cmake-language-server" },
        filetypes = { "cmake" },
        init_options = { buildDirectory = "build" },
        single_file_support = true,
        capabilities = capabilities,
      }

      -- Enable servers
      vim.lsp.enable("clangd")
      vim.lsp.enable("cmake")
    end,
  }
}


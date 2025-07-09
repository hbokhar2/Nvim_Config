return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true
      })
      vim.cmd.colorscheme("gruvbox")
      --[[vim.api.nvim_set_hl(0, "@lsp.type.class.cpp", { underline = true, link = "GruvboxYellow" })
      vim.api.nvim_set_hl(0, "@type.builtin.cpp", { underline = false })]]
      vim.api.nvim_set_hl(0, "@lsp.type.class.cpp", {
        fg = "#fabd2f", -- Gruvbox yellow
        undercurl = true,
      })

    end,
  },
}

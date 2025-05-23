return {
  {
    "goolord/alpha-nvim",
    dependencies = {},
    event = "VimEnter",
    config = function()
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.buttons.val = {
        dashboard.button("n", "New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "Find File", ":FzfLua files<CR>"),
        dashboard.button("s", "Config", ":lua require('fzf-lua').files({ cwd = vim.fn.expand('~/.config/nvim') })<CR>"),


        dashboard.button("q", "Quit", ":qa<CR>"),
      }

      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }

      --For quotes and text at the bottom of the screen.
      --dashboard.section.footer.val = {
        -- "",
        --"",
        --"All these bytes will be lost in time,",
        --"              like tears in the rain.",
        --}
        --dashboard.section.footer.opts.hl = "Comment"

        require("alpha").setup(dashboard.opts)

      end,
    }

  }

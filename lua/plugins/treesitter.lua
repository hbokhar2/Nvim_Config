return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "lua", "ada", "python", "cmake" },
        sync_install = true,
        auto_install = true,

        ignore_install = {},      -- add this line to explicitly declare no ignored parsers
        modules = {},             -- add empty modules table

        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
        playground = { enable = true },
      }
    end
  },

  { "nvim-treesitter/playground" }

}

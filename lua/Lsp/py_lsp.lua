local python_config = {
    cmd = { "pylsp" },

    filetypes = { "python" },

    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        ".git",
    },

    settings = {
        pylsp = {
            plugins = {
                pyflakes = { enabled = true },
                pycodestyle = { enabled = true },
                autopep8 = { enabled = true },
                jedi_completion = { fuzzy = true },
            }
        }
    }
}

vim.lsp.config('pylsp', python_config)
vim.lsp.enable('pylsp')

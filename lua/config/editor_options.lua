vim.opt.tabstop = 2 -- Tab Spacing
vim.opt.shiftwidth = 2 -- Indent amount with << and >>
vim.opt.expandtab = true -- User spaces instead of tabs
vim.opt.number = true -- Absolute line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.defer_fn(function()
  local class_highlights = {
    "@lsp.type.class.cpp",
    "@lsp.typemod.class.declaration.cpp",
    "@lsp.typemod.class.definition.cpp",
    "@lsp.typemod.class.constructorOrDestructor.cpp",
    "@lsp.typemod.class.globalScope.cpp",
  }

  for _, hl in ipairs(class_highlights) do
    vim.api.nvim_set_hl(0, hl, { underline = true, link = "GruvboxYellow" })
  end
end, 100)


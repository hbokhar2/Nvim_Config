return {
  "andweeb/presence.nvim",
  config = function()
    require("presence").setup({
      auto_update = true,
      show_time = true,
      editing_text = "Editing %s"
    })
  end
}

return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    cond = function()
      if os.getenv("GTK_THEME") == "Kanagawa-Dragon" then
        return true
      else
        return false
      end
    end,
    priority = 1000,
  },
}


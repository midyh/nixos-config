return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    cond = function()
      if os.getenv("GTK_THEME") == "Nordic" then
        return true
      else
        return false
      end
    end,
    priority = 1000,
    config = function()
      vim.g.nord_contrast = false
      vim.g.nord_borders = true
      vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
			vim.g.nord_enable_sidebar_background = true
			vim.g.nord_bold = true
			vim.g.nord_cursorline_transparent = false
			require("nord").set()
    end,
  },
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


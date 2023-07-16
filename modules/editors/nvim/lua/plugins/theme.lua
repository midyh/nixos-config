return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
      background = {
        light = "mocha",
        dark = "mocha",
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end,
}

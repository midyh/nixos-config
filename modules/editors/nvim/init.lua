require("base")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim";
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_theme
if os.getenv("GTK_THEME") == "Catppuccin-Frappe-Pink" then
  lazy_theme = "catppuccin-frappe"
elseif os.getenv("GTK_THEME") == "Kanagawa-Dragon" then
  lazy_theme = "kanagawa-dragon"
end

local opts = {
  install = {
    colorscheme = { lazy_theme },
  },
  ui = {
    size = { width = 1.0, height = 1.0 },
  },
}

require("lazy").setup("plugins", opts)


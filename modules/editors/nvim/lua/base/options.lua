local options = {
  nu = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  termguicolors = false,
  hlsearch = false,
  scrolloff = 20,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


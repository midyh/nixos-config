return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufRead",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c", "lua", "rust", "nix" },
      auto_install = false,
      sync_install = false,
      ignore_install = { "" },
      highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { "" } },
    })
  end
}


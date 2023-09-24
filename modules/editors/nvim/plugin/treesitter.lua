require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "java", "nix" },

  auto_install = false,

  highlight = { enable = true },

  indent = { enable = true },
}


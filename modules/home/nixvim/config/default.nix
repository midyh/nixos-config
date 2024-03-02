{ ... }:
{
  programs.nixvim.enable = true;
  imports = [
    ./autopairs.nix
    ./colorscheme.nix
    ./keymaps.nix
    ./lsp.nix
    ./nvim-tree.nix
    ./options.nix
    ./telescope.nix
    ./treesitter.nix
  ];
}


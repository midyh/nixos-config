{ config, lib, inputs, pkgs, ... }:

{
  nixpkgs.config = {
    programs.npm.npmrc = ''
      prefix = ''${HOME}/.npm-global
    '';
  };

  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      withNodeJs = true;
      extraPackages = [ ];

      plugins = with pkgs.vimPlugins; [ ];
    };
  };

  home = {
    packages = with pkgs; [
      nil
      lua-language-server
      rust-analyzer
      clang-tools

      tree-sitter

      stylua
      nixpkgs-fmt
      rustfmt
    ];
  };

  home.file.".config/nvim/init.lua".source = ./init.lua;
  home.file.".config/nvim/lua".source = ./lua;
}


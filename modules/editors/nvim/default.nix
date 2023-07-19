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
      vimAlias = true;
      viAlias = true;
    };
  };

  home = {
    packages = with pkgs; [
      nil
      lua-language-server
      rust-analyzer
      clang-tools

      #tree-sitter

      stylua
      nixpkgs-fmt
    ];
  };
}


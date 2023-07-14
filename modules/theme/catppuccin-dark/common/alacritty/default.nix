{ config, pkgs, ... }:

{
  programs = {
    alacritty.settings = {
      #theme = "Catppuccin-Mocha";
      font.name = "FiraCode Nerd Font";
      font.size = 14;
    };
  };
}


{ lib, pkgs, user, ... }:

{
  home.file.".config/fish/conf.d/kanagawa-dragon.fish".text = import ./conf.d/kanagawa_dragon.nix;
}


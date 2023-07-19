{ config, pkgs, ... }:

{
  programs.kitty = {
    font.name = "FiraCode Nerd Font";
    font.size = 14;
    settings = {
      url_prefexis = [ "https" "http" ];
    };
  };
}


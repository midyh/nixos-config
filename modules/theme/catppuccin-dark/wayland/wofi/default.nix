{ lib, pkgs, user, ... }:

{
  home.file.".config/wofi/powermenu.sh".source = ./powermenu.sh;
}


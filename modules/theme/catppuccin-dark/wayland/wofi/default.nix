{ lib, pkgs, user, ... }:

{
  home.file.".config/wofi/powermenu.sh".source = ./powermenu.sh;
  home.file.".config/wofi/off.sh".source = ./off.sh;
}


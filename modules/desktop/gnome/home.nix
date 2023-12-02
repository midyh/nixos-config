{ pkgs, ... }:

{
  imports = [ ../../environment/gnome-variables.nix ];
  dconf.settings."org/gnome/desktop/wm/preferences".button-layout = "menu:minimize,maximize,close";
}

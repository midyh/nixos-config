{ config, lib, pkgs, user, ... }:

{
  imports =
    [ (import ../../../modules/desktop/sway/home.nix) ] ++
    [ (import ../../../modules/scripts) ] ++
    (import ../../../modules/shell) ++
    (import ../../../modules/editors) ++
    (import ../../../modules/programs/wayland) ++
    (import ../../../modules/theme/mountain/wayland);
    #(import ../../../modules/theme/catppuccin-dark/wayland);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.05";
}

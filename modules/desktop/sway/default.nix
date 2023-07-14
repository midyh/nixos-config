{ config, lib, pkgs, ... }:

{
  imports = [ ../../programs/wayland/waybar/sway_waybar.nix ];

  hardware.opengl.enable = true;

  programs = {
    dconf.enable = true;
    light.enable = true;
  };
  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
  };
}

{ config, lib, pkgs, ... }:

let
  myswaylock = pkgs.writeShellScriptBin "myswaylock" ''
    swaylock \
      --screenshots \
      --clock \
      --indicator \
      --indicator-radius 100 \
      --indicator-thickness 7 \
      --effect-blur 7x5 \
      --effect-vignette 0.5:0.5 \
      --ring-color 3b4252 \
      --key-hl-color 880033 \
      --line-color 00000000 \
      --inside-color 00000088 \
      --separator-color 00000000 \
      --grace 2 \
      --fade-in 0.3
  '';

  default_wall = pkgs.writeShellScriptBin "default_wall" ''
    swaybg -i "${../theme/mountain/common/wall/wallpaper.jpg}"
  '';

  launch_waybar = pkgs.writeShellScriptBin "launch_waybar" ''
    #!/bin/bash
    killall .waybar-wrapped
    SDIR="$HOME/.config/waybar"
    waybar -c "$SDIR"/config -s "$SDIR"/style.css > /dev/null 2>&1 &
  '';

in
{
  home.packages = with pkgs; [
    myswaylock
    default_wall
    launch_waybar
  ];
}


{ pkgs, ... }:

let
  myswaylock = pkgs.writeShellScriptBin "myswaylock" ''
    swaylock
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
  home.packages = [
    myswaylock
    default_wall
    launch_waybar
  ];
}


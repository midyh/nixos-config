let
  common = import ../common;
in
[
  ./notice
  ./waybar
  ./wofi
] ++ common


{ config, pkgs, lib, inputs, user, ... }:

{
  home.sessionVariables = {
    GTK_THEME = "Nordic";
  };

  home.pointerCursor = {
    package = pkgs.nordzy-cursors;
    name = "Nordic";
    size = 16;
  };

  home.pointerCursor.gtk.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };

    cursorTheme = {
      name = "Nordic";
    };

    font = {
      name = "FiraCode Nerd Font";
      size = 13;
    };

    gtk3.extraConfig = {
      gtk-xft-antialias = 0; # 1
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };

    gtk2.extraConfig = ''
      gtk-xft-antialias = 0;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    '';
  };
}

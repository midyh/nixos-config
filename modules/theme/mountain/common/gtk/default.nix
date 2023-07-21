{ pkgs, ... }:

{
  home.sessionVariables = {
    GTK_THEME = "Nordic-Bluish";
  };

  home.pointerCursor = {
    package = pkgs.catppuccin-cursors;
    name = "Nordic-Bluish";
    size = 16;
  };

  home.pointerCursor.gtk.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "Nordic-Bluish";
      package = pkgs.nordic-bluish-gtk;
    };

    cursorTheme = {
      name = "Nordic-Bluish";
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "Open Sans";
      size = 13;
    };

    gtk3.extraConfig = {
      gtk-xft-antialias = 1; # 1
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

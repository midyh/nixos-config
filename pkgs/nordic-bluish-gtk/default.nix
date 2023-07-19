{ lib, stdenv, fetchzip, pkgs, ... }:

stdenv.mkDerivation {
  pname = "nordic-bluish-gtk";
  version = "2.2.0";

  src = fetchzip {
    url =
      "https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic-bluish-accent-standard-buttons.tar.xz";
    sha256 = "00gwrdn1biaz95k3nnnkwnsqcqvb369hglmlb77hc728msgqs6kp";
    stripRoot = false;
  };

  propagatedUserEnvPkgs = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes/
    cp -r Nordic-Bluish $out/share/themes
  '';

  meta = {
    description = "Soothing pastel theme for GTK3";
    homepage = "https://github.com/EliverLara/Nordic";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
  };
}


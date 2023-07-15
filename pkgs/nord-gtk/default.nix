{ lib, stdenv, fetchTarball, pkgs, ... }:

stdenv.mkDerivation rec {
  pname = "nordic-gtk";
  version = "2.2.0";

  src = fetchTarball {
    url = "https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic.tar.xz";
    sha256 = "d162d694e13bec518636b193fbe84ccea44da9a81a89015c6713f6b258ee36d5";
  };

  propagatedUserEnvPkgs = with pkgs; [ ];

  installPhase = ''
    mkdir -p $out/share/themes/
    cp -r Nordic $out/share/themes
  '';

  meta = with lib; {
    description = "Gtk and KDE themes using the Nord color pallete";
    homepage = "https://github.com/EliverLara/Nordic";
    license = licenses.gpl3Only;
    platforms = platforms.all;
    maintainers = [ maintainers.romildo ];
  };
}


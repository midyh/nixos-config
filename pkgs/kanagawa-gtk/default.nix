{ lib, stdenv, fetchgit, pkgs, ... }:

stdenv.mkDerivation rec {
  pname = "kanagawa-gtk";
  version = "0.0.0";

  src = fetchgit {
    url = "https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme.git";
    sparseCheckout = ''
      themes
    '';
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r themes $out/share/themes
  '';
}


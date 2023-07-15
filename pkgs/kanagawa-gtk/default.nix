{ lib, stdenv, fetchgit, pkgs, ... }:

stdenv.mkDerivation rec {
  pname = "kanagawa-gtk";
  version = "0.0.0";

  src = fetchgit {
    url = "https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme.git";
    sparseCheckout = [ "themes" ];
    sha256 = "sha256-6FoxQ+w5rToaaluB/tzbiEHc2PcH7PoCxJ/rKeF/LxQ=";
  };

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r themes $out/share/themes
  '';
}


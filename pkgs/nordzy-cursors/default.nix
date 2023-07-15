{ lib, stdenv, fetchTarball, ... }:

stdenv.mkDerivation rec {
  pname = "nordzy-cursors";
  version = "0.6.0";

  src = fetchTarball {
    url = "https://github.com/alvatip/Nordzy-cursors/releases/download/v0.6.0/Nordzy-cursors.tar.gz";
    sha256 = "ca0e488f746c0ed997e1d034a9ecbf8462ebd0c2257b7ef0882f0b4f1565a86d";
  };

  installPhase = ''
    mkdir -p $out/share/icons/Nordic
    cp -va cursors index.theme $out/share/icons/Nordic
  '';

  meta = {
    description = "Cursor theme using the Nord color palette and based on Vimix and cz-Viator.";
    homepage = "https://github.com/alvatip/Nordzy-cursors/";
    license = lib.licenses.gpl3;
  };
}


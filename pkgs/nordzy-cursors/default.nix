{ lib, stdenv, fetchzip, ... }:

stdenv.mkDerivation rec {
  pname = "nordzy-cursors";
  version = "0.6.0";

  src = fetchzip {
    url = "https://github.com/alvatip/Nordzy-cursors/releases/download/v0.6.0/Nordzy-cursors.tar.gz";
    sha256 = "1lbl22z3cxb3yj86j6aqpfvjpih8zfg7vjnkawv1wwdg54y5cxaf";
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


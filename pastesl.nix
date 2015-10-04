{stdenv }:
stdenv.mkDerivation {
  name = "pastesl-git";
  src = fetchgit {
    url = https://github.com/sjau/pastesl;
    rev = "d4a292bfe369b934e4d014bf58a20e25cf7f2bb4";
    sha256 = "0giy09fwsdv35801sqrjbrihql88fksk0bl4w351wxibzhgn1vsa";
  };
  installPhase = ''
    mkdir -p $out/bin
    cp -n pastesl $out/bin/
  '';
}

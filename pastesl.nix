{stdenv, fetchgit }:
stdenv.mkDerivation {
  name = "pastesl-git";
  src = fetchgit {
    url = https://github.com/sjau/pastesl.git;
    rev = "09c8b961f4373fe4ace0d21f73c7bbf12d659eb6";
    sha256 = "0d2xvrrz70w3k92skgp59wwpclxcf518kvh6z201n6vsdjjqrxhd";
  };
  installPhase = ''
    mkdir -p $out/bin
    cp -n pastesl $out/bin/
  '';
}

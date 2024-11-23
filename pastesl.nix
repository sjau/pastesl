{stdenv, curl, fetchgit }:
stdenv.mkDerivation {
  name = "pastesl-git";
  src = fetchgit {
    url = https://github.com/sjau/pastesl.git;
    rev = "d9eefa4667a098cfa924641bdd6d6a9a31ff35d2";
    sha256 = "sha256-YTngMRqaxwdrsxXk8oHq2Ji2sb9ruCkUadv75pUGg8s=";
  };
  installPhase = ''
    mkdir -p $out/bin
    cp -n pastesl $out/bin/

    for i in $out/bin/*; do
      substituteInPlace $i \
        --replace curl ${curl}/bin/curl
    done

  '';
}

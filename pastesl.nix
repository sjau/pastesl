{stdenv, curl, jq, fetchgit }:
stdenv.mkDerivation {
  name = "pastesl-git";
  src = fetchgit {
    url = https://github.com/sjau/pastesl.git;
    rev = "a9cf366a97f0f60d8a7e50175e4c2f0e97beafb2";
    sha256 = "sha256-YTngMRqaxwdrsxXk8oHq2Ji2sb9ruCkUadv75pUGg899";
  };
  installPhase = ''
    mkdir -p $out/bin
    cp -n pastesl $out/bin/

    for i in $out/bin/*; do
      substituteInPlace $i \
        --replace curl ${curl}/bin/curl
        --replace jq ${jq}/bin/jq
    done

  '';
}

{stdenv, curl, fetchgit }:
stdenv.mkDerivation {
  name = "pastesl-git";
  src = fetchgit {
    url = https://github.com/sjau/pastesl.git;
    rev = "2da124a77e58c542934f7811e6e2fe695e5cc8cd";
    sha256 = "183lf8ypxdwr6zrikn0pn3brr7ninxnd5pvw10a6np4jr2gf0vph";
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

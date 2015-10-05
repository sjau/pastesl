{stdenv, curl, fetchgit }:
stdenv.mkDerivation {
  name = "pastesl-git";
  src = fetchgit {
    url = https://github.com/sjau/pastesl.git;
    rev = "fbbe666b1398b39c9f4ea44283a278cadc25bae3";
    sha256 = "1jg1cv6miwj4ir9li5i8qj5mhag0kai7r5rvjjq5hwga6dgh3clr";
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

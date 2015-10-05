{stdenv, curl, fetchgit }:
stdenv.mkDerivation {
  name = "pastesl-git";
  src = fetchgit {
    url = https://github.com/sjau/pastesl.git;
    rev = "900ae1df2a68329126c0c38d1c06550cf3bfc826";
    sha256 = "1lh5dgxzzg698s9w7qxzqg772nky2cbivn63cp50ar2dpncfb991";
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

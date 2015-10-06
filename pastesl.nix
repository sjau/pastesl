{stdenv, curl, fetchgit }:
stdenv.mkDerivation {
  name = "pastesl-git";
  src = fetchgit {
    url = https://github.com/sjau/pastesl.git;
    rev = "c943d543a9ee3de8fd968ae08ed8316e4dfe71f9";
    sha256 = "09izp42plnjl63j9s3k8yfar351wqcl036svskvqq3kn8lxakd44";
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

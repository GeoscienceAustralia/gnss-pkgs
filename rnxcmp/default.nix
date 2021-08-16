{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "rnxcmp";
  version = "4.0.8";

  src = pkgs.fetchurl {
    # This is same as https://terras.gsi.go.jp/ja/crx2rnx/RNXCMP_${version}_src.tar.gz,
    # which will be removed when superseded by a newer version.
    url = "https://geodesy-third-party-tools.s3-ap-southeast-2.amazonaws.com/RNXCMP_${version}_src.tar.gz";
    hash = "sha256:19kw2sp1pj8v6blrgz16gnnknj8l665g4dj9l6vq54pvd7ddha9i";
  };

  buildPhase = ''
    cd source
    ${pkgs.gcc}/bin/gcc -o rnx2crx rnx2crx.c
    ${pkgs.gcc}/bin/gcc -o crx2rnx crx2rnx.c
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp rnx2crx $out/bin
    cp crx2rnx $out/bin
  '';
}

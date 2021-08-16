{ pkgs }:

let
  eigenGit = pkgs.stdenv.mkDerivation rec {
    pname = "eigen";
    version = "master";

    src = fetchGit {
      url = "https://gitlab.com/libeigen/eigen";
      rev = "66499f0f172d0758360043e9c578761c0f7d50cd";
      ref = "master";
    };

    nativeBuildInputs = [ pkgs.cmake ];
  };
in
  pkgs.stdenv.mkDerivation {
    pname = "ginan";
    version = "master";

    src = fetchGit {
      url = "https://github.com/GeoscienceAustralia/ginan";
      rev = "598cfff85be52c53c4a03bca7c0540a9200b1ee3";
      ref = "main";
    };

    nativeBuildInputs = with pkgs; [ cmake gfortran ];
    buildInputs = with pkgs; [
      boost173
      eigenGit
      libyamlcpp
      (openblas.overrideAttrs (attrs: {
        makeFlags = (lib.remove "INTERFACE64=1" attrs.makeFlags)
          ++ [ "INTERFACE64=0" ];
      }))
      openssl
    ];

    patches = [
      ./find-basename-in-path.patch
      ./use-boost-shared-libs.patch
    ];

    preConfigure = ''
      cd src
    '';

    cmakeFlags = [
      "-DENABLE_OPTIMISATION=TRUE"
      "-DNETCDF_INCLUDES=${pkgs.netcdf}/include"
      "-DNETCDF_LIBRARIES=${pkgs.netcdf}/lib/libnetcdf.so"
      "-DNETCDF_INCLUDES_CXX=${pkgs.netcdfcxx4}/include"
      "-DNETCDF_LIBRARIES_CXX=${pkgs.netcdfcxx4}/lib/libnetcdf-cxx4.so"
    ];

    installPhase = ''
      mkdir -p $out
      cp -r ../../{bin,lib} $out
    '';
  }

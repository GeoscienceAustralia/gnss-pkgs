{
  description = "GNSS Tools";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    {
      overlay = final: prev: import ./default.nix final prev;
    } //
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in {
        packages = {
          ginan = import ./ginan { inherit pkgs; };
          rnxcmp = import ./rnxcmp { inherit pkgs; };
        };
      }
    );
}

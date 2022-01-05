{ system ? builtins.currentSystem
, config ? {}
}:

let
  sources = import ./sources.nix { inherit pkgs; };

  iohkNix = import sources.iohk-nix {};

  nixpkgs = sources.nixpkgs;

  overlays = [
    (self: super: {
      python38 =
        let
          packageOverrides = python-self: python-super: {
            pandoc-xnos = super.python3Packages.callPackage ./pkgs/pandoc-xnos.nix {};
            pandoc-fignos = super.python3Packages.callPackage ./pkgs/pandoc-fignos.nix {};
            pandoc-eqnos = super.python3Packages.callPackage ./pkgs/pandoc-eqnos.nix {};
            pandoc-tablenos = super.python3Packages.callPackage ./pkgs/pandoc-tablenos.nix {};
            manubot = super.python3Packages.callPackage ./pkgs/manubot.nix {};
            errorhandler = super.python3Packages.callPackage ./pkgs/errorhandler.nix {};
            base62 = super.python3Packages.callPackage ./pkgs/base62.nix {};
          };
        in
          super.python38.override { inherit packageOverrides; };
    })
  ] ++ iohkNix.overlays.iohkNix;

  pkgs = import nixpkgs {
    inherit system overlays config;
  };

in pkgs

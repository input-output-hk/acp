{ system ? builtins.currentSystem
, pkgs ? import ./nix { inherit system; }
, config ? {}
}:

{
  acp-site = pkgs.callPackage ./nix/pkgs/site.nix {
    inherit (pkgs.haskell.packages.ghc8107) pandoc;
    inherit (pkgs.python38Packages) pandoc-xnos pandoc-fignos pandoc-eqnos pandoc-tablenos manubot;
  };
}

{ system ? builtins.currentSystem
, pkgs ? import ./nix { inherit system; }
, config ? {}
}:

rec {
  acp-site = pkgs.callPackage ./nix/pkgs/site.nix {
    inherit (pkgs.haskell.packages.ghc8107) pandoc;
    inherit (pkgs.python38Packages) pandoc-xnos pandoc-fignos pandoc-eqnos pandoc-tablenos manubot;
  };

  acp-site-tarball = pkgs.runCommand "acp-site-tarball" {}
  ''
    mkdir -p $out
    tar -czvf $out/acp-site.tar.gz -C ${acp-site}/share/doc/acp --preserve-permissions .

    mkdir -p $out/nix-support/
    echo "file tarball $out/acp-site.tar.gz" >> $out/nix-support/hydra-build-products
  '';
}

{ system ? builtins.currentSystem
, pkgs ? import ./nix { inherit system; }
}:

pkgs.mkShell {
  # Explanation of buildInputs vs nativeBuildInputs:
  # https://discourse.nixos.org/t/use-buildinputs-or-nativebuildinputs-for-nix-shell/8464/2
  nativeBuildInputs = with pkgs; [
    pandoc
    python38Packages.pandoc-xnos
    python38Packages.pandoc-fignos
    python38Packages.pandoc-eqnos
    python38Packages.pandoc-tablenos
    python38Packages.manubot
  ];
}

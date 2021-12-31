{ system ? builtins.currentSystem
, pkgs ? import ./nix { inherit system; }
}:

let
  jobs = {
    acp-site = (import ./default.nix { inherit system pkgs; }).acp-site;
  };
in
  jobs

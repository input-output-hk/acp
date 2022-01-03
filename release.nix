{ system ? builtins.currentSystem
, pkgs ? import ./nix { inherit system; }
}:

let
  jobs = {};
in
  jobs

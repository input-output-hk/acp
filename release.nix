{ acp ? { outPath = ./.; rev = pkgs.iohkNix.commitIdFromGitRepoOrZero ./.git; }
, system ? builtins.currentSystem
, pkgs ? import ./nix { inherit system; }
  # What systems to use for building.
, supportedSystems ? [ "x86_64-linux" "x86_64-darwin" ]
  # What systems to use for cross-compilation builds.
, supportedCrossSystems ? [ "x86_64-linux" ]
  # Hydra option
, scrubJobs ? true
  # Arguments to pass to packageSet.
, projectArgs ? { config = { allowUnfree = false; inHydra = true; }; }
  # Project source git revision, for "mkRequiredJob"
, gitrev ? null
  # Pull request number provided by Hydra
, pr ? null
}:

let
  releaseLib = import pkgs.iohkNix.release-lib {
    inherit pkgs scrubJobs projectArgs;
    supportedSystems = [ system ];
    supportedCrossSystems = pkgs.lib.filter (s: s == system) supportedCrossSystems;
    packageSet = import acp;
    gitrev = acp.rev;
  };

  # Use this to fix absolute URLs on GitHub pages ($url-prefix$ in pandoc
  # templates).
  urlPrefix = "/acp" + (
    if (pr != null)
    then "/pull-requests/${pr}"
    else "/master"
  );

  jobs = {
    acp-site = (import ./default.nix { inherit system pkgs urlPrefix; }).acp-site;
    acp-site-tarball = (import ./default.nix { inherit system pkgs urlPrefix; }).acp-site-tarball;
  } // releaseLib.mkRequiredJob [
    jobs.acp-site
    jobs.acp-site-tarball
  ];
  # ^ It is required to make a required job for Hydra to function as needed, see
  # this comment from iohk-nix:
  # > ... it forces Hydra to re-evaluate every commit. The side-effect of that
  # > is that Hydra reports build status to GitHub for every commit, which we
  # > want, and it wouldn't normally do.
in
  jobs

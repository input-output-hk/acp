{ lib, stdenv, pandoc, pandoc-xnos, pandoc-fignos, pandoc-eqnos, pandoc-tablenos, manubot }:

stdenv.mkDerivation rec {
  pname = "acp-html";
  version = "0.0.1";

  src = fetchGit ../..;

  phases = [ "unpackPhase" "buildPhase" "installPhase" ];

  nativeBuildInputs = [
    pandoc
    pandoc-xnos
    pandoc-fignos
    pandoc-eqnos
    pandoc-tablenos
    manubot
  ];

  buildPhase = ''
    PANDOC_DATA_DIR="$src"

    mkdir -p output/proposals

    echo >&2 "PANDOC_DATA_DIR: $PANDOC_DATA_DIR"
    echo >&2 "Exporting assets"
    cp -r assets output/assets

    echo >&2 "Exporting HTML manuscript"
    find proposals/ -maxdepth 1 -type f -exec sh \
      -c 'pandoc --verbose \
           --data-dir="$PANDOC_DATA_DIR" \
           --defaults=config/pandoc/common.yaml \
           --defaults=config/pandoc/html.yaml \
           --defaults=config/pandoc/html-proposal.yaml \
           --output=output/proposals/$(basename $1 .md).html \
           $1' \
      sh {} \;
    pandoc --verbose \
           --data-dir="$PANDOC_DATA_DIR" \
           --defaults=config/pandoc/common.yaml \
           --defaults=config/pandoc/html.yaml \
           --output=output/index.html \
           README.md
  '';

  installPhase = ''
    mkdir -p $out/share/doc/acp
    cp -r output/* $out/share/doc/acp/
  '';

  meta = with lib; {
  };
}

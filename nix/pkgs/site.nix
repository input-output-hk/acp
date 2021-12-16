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

    mkdir -p output

    echo >&2 "PANDOC_DATA_DIR: $PANDOC_DATA_DIR"
    echo >&2 "Exporting HTML manuscript"
    pandoc --verbose \
      --data-dir="$PANDOC_DATA_DIR" \
      --defaults=config/pandoc/common.yaml \
      --defaults=config/pandoc/html.yaml \
      --output=output/index.html \
      proposals/01.md
  '';

  installPhase = ''
    mkdir -p $out/share/doc/acp
    cp -r output/* $out/share/doc/acp/
  '';

  meta = with lib; {
  };
}

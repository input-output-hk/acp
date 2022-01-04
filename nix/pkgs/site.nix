{ lib, stdenv, pandoc, pandoc-xnos, pandoc-fignos, pandoc-eqnos, pandoc-tablenos, manubot }:

let
  filter = name: type: let
    baseName = baseNameOf (toString name);
    sansPrefix = lib.removePrefix (toString ../.) name;
  in !(
    baseName == "output"
  );
in
stdenv.mkDerivation rec {
  pname = "acp-html";
  version = "0.0.1";

  src = lib.cleanSourceWith {
    name = pname;
    inherit filter;
    src = lib.cleanSource ../..;
  };

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
    PANDOC_DATA_DIR="$src/config/pandoc"

    mkdir -p output/proposals

    echo >&2 "PANDOC_DATA_DIR: $PANDOC_DATA_DIR"
    echo >&2 "Exporting assets"
    cp -r assets output/assets

    echo >&2 "Exporting HTML"
    # Convert proposals
    find proposals/ -type f -exec sh \
      -c 'mkdir -p output/$(dirname $1)/ && pandoc --verbose \
           --data-dir="$PANDOC_DATA_DIR" \
           --resource-path="$PANDOC_DATA_DIR" \
           --defaults=config/pandoc/defaults/common.yaml \
           --defaults=config/pandoc/defaults/html.yaml \
           --defaults=config/pandoc/defaults/html-proposal.yaml \
           --output=output/$(dirname $1)/$(basename $1 .md).html \
           $1' \
      sh {} \;
    # Convert landing page
    pandoc --verbose \
           --data-dir="$PANDOC_DATA_DIR" \
           --resource-path="$PANDOC_DATA_DIR" \
           --defaults=config/pandoc/defaults/common.yaml \
           --defaults=config/pandoc/defaults/html.yaml \
           --output=output/index.html \
           README.md

    # Convert README.html to index.html (map GitHub behaviour to HTML).
    find output -type f -wholename "*README.html" -exec sh \
      -c 'mv $1 $(dirname $1)/index.html' \
      sh {} \;
  '';

  installPhase = ''
    mkdir -p $out/share/doc/acp
    cp -r output/* $out/share/doc/acp/
  '';

  meta = with lib; {
  };
}

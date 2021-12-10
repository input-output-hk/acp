#!/usr/bin/env bash

PANDOC_DATA_DIR="${PANDOC_DATA_DIR:-config/pandoc}"

mkdir -p output

echo >&2 "PANDOC_DATA_DIR: $PANDOC_DATA_DIR"
echo >&2 "Exporting HTML manuscript"
pandoc --verbose \
  --data-dir="$PANDOC_DATA_DIR" \
  --defaults=config/pandoc/common.yaml \
  --defaults=config/pandoc/html.yaml \
  ./proposals/01.md

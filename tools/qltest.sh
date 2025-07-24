#!/bin/sh

set -eu

exec "${CODEQL_DIST}/codeql" database index-files \
    --prune="**/*.testproj" \
    --include-extension=.wat \
    --size-limit=5m \
    --language=webassembly \
    --working-dir=.\
    "$CODEQL_EXTRACTOR_WEBASSEMBLY_WIP_DATABASE"

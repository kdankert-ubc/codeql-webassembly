#!/bin/sh

set -eu

exec "${CODEQL_EXTRACTOR_WEBASSEMBLY_ROOT}/tools/${CODEQL_PLATFORM}/webassembly-extractor" extract \
        --file-list "$1" \
        --source-archive-dir "$CODEQL_EXTRACTOR_WEBASSEMBLY_SOURCE_ARCHIVE_DIR" \
        --output-dir "$CODEQL_EXTRACTOR_WEBASSEMBLY_TRAP_DIR"

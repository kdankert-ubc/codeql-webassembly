@echo off

type NUL && "%CODEQL_EXTRACTOR_WEBASSEMBLY_ROOT%\tools\win64\webassembly-extractor.exe" extract ^
        --file-list "%1" ^
        --source-archive-dir "%CODEQL_EXTRACTOR_WEBASSEMBLY_SOURCE_ARCHIVE_DIR%" ^
        --output-dir "%CODEQL_EXTRACTOR_WEBASSEMBLY_TRAP_DIR%"

exit /b %ERRORLEVEL%

@echo off

type NUL && "%CODEQL_EXTRACTOR_WEBASSEMBLY_ROOT%\tools\%CODEQL_PLATFORM%\webassembly-extractor" autobuild

exit /b %ERRORLEVEL%

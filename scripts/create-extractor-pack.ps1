cd extractor
cargo build --release
cd ..

extractor\target\release\webassembly-extractor generate --dbscheme ql/lib/webassembly.dbscheme --library ql/lib/codeql/webassembly/ast/internal/TreeSitter.qll

codeql query format -i ql\lib\codeql\webassembly\ast\internal\TreeSitter.qll

rm -Recurse -Force extractor-pack
mkdir extractor-pack | Out-Null
cp codeql-extractor.yml, ql\lib\webassembly.dbscheme, ql\lib\webassembly.dbscheme.stats extractor-pack
cp -Recurse tools extractor-pack
cp -Recurse downgrades extractor-pack
mkdir extractor-pack\tools\win64 | Out-Null
cp extractor\target\release\webassembly-extractor.exe extractor-pack\tools\win64\webassembly-extractor.exe

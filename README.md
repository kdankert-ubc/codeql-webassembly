# codeql-webassembly
CodeQL for LLVM WebAssembly.

## Setup 

- Install Rust (rustup.rs)
- Install CodeQL CLI ([Setting up the CodeQL CLI](https://docs.github.com/en/code-security/codeql-cli/getting-started-with-the-codeql-cli/setting-up-the-codeql-cli))
- Run `scripts/create-extractor-pack.sh`
  - [optional] Update `codeql` to `gh codeql`
- Install lib packs
  - `cd ql/lib && gh codeql pack install`

**Create Database:**

```bash
gh codeql database create \
    --language=webassembly --overwrite \
    --search-path $PWD/extractor-pack \
    --source-root ./testing/source \
    ./testing/database
```

**Run Query:**

```
gh codeql query run \
    -d ./testing/database/ \
    query.ql
```

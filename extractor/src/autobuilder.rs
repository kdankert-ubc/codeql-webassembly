use clap::Args;
use std::env;
use std::path::PathBuf;
use std::process::Command;

#[derive(Args)]
// The autobuilder takes no command-line options, but this may change in the future.
pub struct Options {}

pub fn run(_: Options) -> std::io::Result<()> {
    let dist = env::var("CODEQL_DIST").expect("CODEQL_DIST not set");
    let db = env::var("CODEQL_EXTRACTOR_WEBASSEMBLY_WIP_DATABASE")
        .expect("CODEQL_EXTRACTOR_WEBASSEMBLY_WIP_DATABASE not set");
    let codeql = if env::consts::OS == "windows" {
        "codeql.exe"
    } else {
        "codeql"
    };
    let codeql: PathBuf = [&dist, codeql].iter().collect();
    let mut cmd = Command::new(codeql);
    cmd.arg("database")
        .arg("index-files")
        .arg("--include-extension=.wat")
        .arg("--size-limit=10m")
        .arg("--language=webassembly")
        .arg("--working-dir=.")
        .arg(db);

    for line in env::var("LGTM_INDEX_FILTERS")
        .unwrap_or_default()
        .split('\n')
    {
        if let Some(stripped) = line.strip_prefix("include:") {
            cmd.arg("--also-match=".to_owned() + stripped);
        } else if let Some(stripped) = line.strip_prefix("exclude:") {
            cmd.arg("--exclude=".to_owned() + stripped);
        }
    }
    let exit = &cmd.spawn()?.wait()?;
    std::process::exit(exit.code().unwrap_or(1))
}

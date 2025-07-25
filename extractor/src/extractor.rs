use clap::Args;
use std::path::PathBuf;

use codeql_extractor::extractor::simple;
use codeql_extractor::trap;

#[derive(Args)]
pub struct Options {
    /// Sets a custom source achive folder
    #[arg(long)]
    source_archive_dir: PathBuf,

    /// Sets a custom trap folder
    #[arg(long)]
    output_dir: PathBuf,

    /// A text file containing the paths of the files to extract
    #[arg(long)]
    file_list: PathBuf,
}

pub fn run(options: Options) -> std::io::Result<()> {
    tracing_subscriber::fmt()
        .with_target(false)
        .without_time()
        .with_level(true)
        .with_env_filter(tracing_subscriber::EnvFilter::from_default_env())
        .init();

    let extractor = simple::Extractor {
        prefix: "webassembly".to_string(),
        languages: vec![simple::LanguageSpec {
            prefix: "webassembly",
            ts_language: tree_sitter_webassembly::language(),
            node_types: tree_sitter_webassembly::NODE_TYPES,
            file_extensions: vec!["wat".into()],
        }],
        trap_dir: options.output_dir,
        trap_compression: trap::Compression::from_env("CODEQL_WEBASSEMBLY_TRAP_COMPRESSION"),
        source_archive_dir: options.source_archive_dir,
        file_list: options.file_list,
    };

    extractor.run()
}

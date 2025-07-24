/**
 * @kind graph
 * @id wat/controlflow/cfg
 */

private import codeql.webassembly.Cfg::TestOutput

class MyRelevantNode extends RelevantNode {
  MyRelevantNode() { exists(this) }
}

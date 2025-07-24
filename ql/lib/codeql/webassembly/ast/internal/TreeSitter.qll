/**
 * CodeQL library for WebAssembly
 * Automatically generated from the tree-sitter grammar; do not edit
 */

import codeql.Locations as L

module WebAssembly {
  /** The base class for all AST nodes */
  class AstNode extends @webassembly_ast_node {
    /** Gets a string representation of this element. */
    string toString() { result = this.getAPrimaryQlClass() }

    /** Gets the location of this element. */
    final L::Location getLocation() { webassembly_ast_node_info(this, _, _, result) }

    /** Gets the parent of this element. */
    final AstNode getParent() { webassembly_ast_node_info(this, result, _, _) }

    /** Gets the index of this node among the children of its parent. */
    final int getParentIndex() { webassembly_ast_node_info(this, _, result, _) }

    /** Gets a field or child node of this node. */
    AstNode getAFieldOrChild() { none() }

    /** Gets the name of the primary QL class for this element. */
    string getAPrimaryQlClass() { result = "???" }

    /** Gets a comma-separated list of the names of the primary CodeQL classes to which this element belongs. */
    string getPrimaryQlClasses() { result = concat(this.getAPrimaryQlClass(), ",") }
  }

  /** A token. */
  class Token extends @webassembly_token, AstNode {
    /** Gets the value of this token. */
    final string getValue() { webassembly_tokeninfo(this, _, result) }

    /** Gets a string representation of this element. */
    final override string toString() { result = this.getValue() }

    /** Gets the name of the primary QL class for this element. */
    override string getAPrimaryQlClass() { result = "Token" }
  }

  /** A reserved word. */
  class ReservedWord extends @webassembly_reserved_word, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ReservedWord" }
  }

  class UnderscoreExpression extends @webassembly_underscore_expression, AstNode { }

  class UnderscorePrimaryExpression extends @webassembly_underscore_primary_expression, AstNode { }

  class UnderscorePrototype extends @webassembly_underscore_prototype, AstNode { }

  class UnderscoreRepl extends @webassembly_underscore_repl, AstNode { }

  /** A class representing `binaryOpExpression` nodes. */
  class BinaryOpExpression extends @webassembly_binary_op_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "BinaryOpExpression" }

    /** Gets the node corresponding to the field `lhs`. */
    final UnderscoreExpression getLhs() {
      webassembly_binary_op_expression_def(this, result, _, _)
    }

    /** Gets the node corresponding to the field `operator`. */
    final Identifier getOperator() { webassembly_binary_op_expression_def(this, _, result, _) }

    /** Gets the node corresponding to the field `rhs`. */
    final UnderscoreExpression getRhs() {
      webassembly_binary_op_expression_def(this, _, _, result)
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      webassembly_binary_op_expression_def(this, result, _, _) or
      webassembly_binary_op_expression_def(this, _, result, _) or
      webassembly_binary_op_expression_def(this, _, _, result)
    }
  }

  /** A class representing `binaryPrototype` nodes. */
  class BinaryPrototype extends @webassembly_binary_prototype, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "BinaryPrototype" }

    /** Gets the node corresponding to the field `argument`. */
    final Identifier getArgument(int i) { webassembly_binary_prototype_argument(this, i, result) }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { webassembly_binary_prototype_def(this, result) }

    /** Gets the node corresponding to the field `precedence`. */
    final Number getPrecedence() { webassembly_binary_prototype_precedence(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      webassembly_binary_prototype_argument(this, _, result) or
      webassembly_binary_prototype_def(this, result) or
      webassembly_binary_prototype_precedence(this, result)
    }
  }

  /** A class representing `conditionalExpression` nodes. */
  class ConditionalExpression extends @webassembly_conditional_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ConditionalExpression" }

    /** Gets the node corresponding to the field `condition`. */
    final UnderscoreExpression getCondition() {
      webassembly_conditional_expression_def(this, result, _, _)
    }

    /** Gets the node corresponding to the field `else`. */
    final UnderscoreExpression getElse() {
      webassembly_conditional_expression_def(this, _, result, _)
    }

    /** Gets the node corresponding to the field `then`. */
    final UnderscoreExpression getThen() {
      webassembly_conditional_expression_def(this, _, _, result)
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      webassembly_conditional_expression_def(this, result, _, _) or
      webassembly_conditional_expression_def(this, _, result, _) or
      webassembly_conditional_expression_def(this, _, _, result)
    }
  }

  /** A class representing `externalDeclaration` nodes. */
  class ExternalDeclaration extends @webassembly_external_declaration, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ExternalDeclaration" }

    /** Gets the node corresponding to the field `prototype`. */
    final UnderscorePrototype getPrototype() { webassembly_external_declaration_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      webassembly_external_declaration_def(this, result)
    }
  }

  /** A class representing `forExpression` nodes. */
  class ForExpression extends @webassembly_for_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ForExpression" }

    /** Gets the node corresponding to the field `body`. */
    final UnderscoreExpression getBody() { webassembly_for_expression_def(this, result, _, _) }

    /** Gets the node corresponding to the field `condition`. */
    final UnderscoreExpression getCondition() {
      webassembly_for_expression_def(this, _, result, _)
    }

    /** Gets the node corresponding to the field `initializer`. */
    final Initializer getInitializer() { webassembly_for_expression_def(this, _, _, result) }

    /** Gets the node corresponding to the field `update`. */
    final UnderscoreExpression getUpdate() { webassembly_for_expression_update(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      webassembly_for_expression_def(this, result, _, _) or
      webassembly_for_expression_def(this, _, result, _) or
      webassembly_for_expression_def(this, _, _, result) or
      webassembly_for_expression_update(this, result)
    }
  }

  /** A class representing `functionCallExpression` nodes. */
  class FunctionCallExpression extends @webassembly_function_call_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "FunctionCallExpression" }

    /** Gets the node corresponding to the field `argument`. */
    final UnderscoreExpression getArgument(int i) {
      webassembly_function_call_expression_argument(this, i, result)
    }

    /** Gets the node corresponding to the field `callee`. */
    final Identifier getCallee() { webassembly_function_call_expression_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      webassembly_function_call_expression_argument(this, _, result) or
      webassembly_function_call_expression_def(this, result)
    }
  }

  /** A class representing `functionDefinition` nodes. */
  class FunctionDefinition extends @webassembly_function_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "FunctionDefinition" }

    /** Gets the node corresponding to the field `body`. */
    final UnderscoreExpression getBody() { webassembly_function_definition_def(this, result, _) }

    /** Gets the node corresponding to the field `prototype`. */
    final UnderscorePrototype getPrototype() {
      webassembly_function_definition_def(this, _, result)
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      webassembly_function_definition_def(this, result, _) or
      webassembly_function_definition_def(this, _, result)
    }
  }

  /** A class representing `functionPrototype` nodes. */
  class FunctionPrototype extends @webassembly_function_prototype, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "FunctionPrototype" }

    /** Gets the node corresponding to the field `argument`. */
    final Identifier getArgument(int i) {
      webassembly_function_prototype_argument(this, i, result)
    }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { webassembly_function_prototype_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      webassembly_function_prototype_argument(this, _, result) or
      webassembly_function_prototype_def(this, result)
    }
  }

  /** A class representing `identifier` tokens. */
  class Identifier extends @webassembly_token_identifier, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Identifier" }
  }

  /** A class representing `initializer` nodes. */
  class Initializer extends @webassembly_initializer, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Initializer" }

    /** Gets the node corresponding to the field `expr`. */
    final UnderscoreExpression getExpr() { webassembly_initializer_expr(this, result) }

    /** Gets the node corresponding to the field `variable`. */
    final Identifier getVariable() { webassembly_initializer_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      webassembly_initializer_expr(this, result) or webassembly_initializer_def(this, result)
    }
  }

  /** A class representing `lineComment` tokens. */
  class LineComment extends @webassembly_token_line_comment, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "LineComment" }
  }

  /** A class representing `number` tokens. */
  class Number extends @webassembly_token_number, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Number" }
  }

  /** A class representing `parenExpression` nodes. */
  class ParenExpression extends @webassembly_paren_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ParenExpression" }

    /** Gets the node corresponding to the field `expr`. */
    final UnderscoreExpression getExpr() { webassembly_paren_expression_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { webassembly_paren_expression_def(this, result) }
  }

  /** A class representing `program` nodes. */
  class Program extends @webassembly_program, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Program" }

    /** Gets the node corresponding to the field `statement`. */
    final UnderscoreRepl getStatement(int i) { webassembly_program_statement(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { webassembly_program_statement(this, _, result) }
  }

  /** A class representing `unaryOpExpression` nodes. */
  class UnaryOpExpression extends @webassembly_unary_op_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "UnaryOpExpression" }

    /** Gets the node corresponding to the field `operand`. */
    final UnderscoreExpression getOperand() {
      webassembly_unary_op_expression_def(this, result, _)
    }

    /** Gets the node corresponding to the field `operator`. */
    final Identifier getOperator() { webassembly_unary_op_expression_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      webassembly_unary_op_expression_def(this, result, _) or
      webassembly_unary_op_expression_def(this, _, result)
    }
  }

  /** A class representing `unaryPrototype` nodes. */
  class UnaryPrototype extends @webassembly_unary_prototype, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "UnaryPrototype" }

    /** Gets the node corresponding to the field `argument`. */
    final Identifier getArgument() { webassembly_unary_prototype_def(this, result, _) }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { webassembly_unary_prototype_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      webassembly_unary_prototype_def(this, result, _) or
      webassembly_unary_prototype_def(this, _, result)
    }
  }

  /** A class representing `varInExpression` nodes. */
  class VarInExpression extends @webassembly_var_in_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "VarInExpression" }

    /** Gets the node corresponding to the field `expr`. */
    final UnderscoreExpression getExpr() { webassembly_var_in_expression_def(this, result) }

    /** Gets the node corresponding to the field `initializer`. */
    final Initializer getInitializer(int i) {
      webassembly_var_in_expression_initializer(this, i, result)
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      webassembly_var_in_expression_def(this, result) or
      webassembly_var_in_expression_initializer(this, _, result)
    }
  }

  /** A class representing `variableExpression` nodes. */
  class VariableExpression extends @webassembly_variable_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "VariableExpression" }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { webassembly_variable_expression_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { webassembly_variable_expression_def(this, result) }
  }
}

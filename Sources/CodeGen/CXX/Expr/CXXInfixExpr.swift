import Core

/// A C++ infix operator call expression.
struct CXXInfixExpr: CXXExpr {

  /// The calee expression.
  /// Usually, just an identifier.
  public let callee: CXXExpr

  /// The left-hand-side argument of the operator call.
  public let lhs: CXXExpr

  /// The right-hand-side argument of the operator call.
  public let rhs: CXXExpr

  /// The original node in Val AST.
  /// Typically an expression, but somtimes this can be AssignStmt
  let original: AnyNodeID.TypedNode?

  func writeCode<Target: TextOutputStream>(into target: inout Target) {
    lhs.writeCode(into: &target)
    target.write(" ")
    callee.writeCode(into: &target)
    target.write(" ")
    rhs.writeCode(into: &target)
  }

}

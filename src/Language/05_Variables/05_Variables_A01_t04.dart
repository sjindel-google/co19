/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion variableDeclaration:
 *     declaredIdentiﬁer (‘, ’ identiﬁer)*
 *   ;
 *   declaredIdentiﬁer:
 *     metadata ﬁnalConstVarOrType identiﬁer
 *   ;
 *   ﬁnalConstVarOrType:
 *     ﬁnal type? |
 *     const type? |
 *     varOrType
 *   ;
 *   varOrType:
 *     var |
 *     type
 *   ;
 *   initializedVariableDeclaration:
 *     declaredIdentiﬁer (‘=’ expression)? (‘, ’ initializedIdentiﬁer)*
 *   ;
 *   initializedIdentiﬁer:
 *     identiﬁer (‘=’ expression)?
 *   ;
 *   initializedIdentiﬁerList:
 *     initializedIdentiﬁer (‘, ’ initializedIdentiﬁer)*
 *   ;
 * @description Checks that a variable declaration cannot contain both 'final' and 'var'.
 * @author iefremov
 * @compile-error
 * @reviewer rodionov
 */

main() {
  try {
    final var x = 1;
  } catch(ok) {}
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unary expressions invoke unary operators on objects.
 * unaryExpression:
 *   prefixOperator unaryExpression |
 *   postfixExpression |
 *   unaryOperator super |
 *   '-' super |
 *   incrementOperator assignableExpression
 * ;
 * preﬁxOperator:
 *   ‘-’ |
 *   unaryOperator
 * ;
 * unaryOperator:
 *  ‘!’ |
 *  ‘˜’
 * ;
 * @description Checks that incrementOperator can be used with
 * a reference to function type alias name.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

typedef f();

main() {
  try {
    --f;
  } catch(e) {}
}
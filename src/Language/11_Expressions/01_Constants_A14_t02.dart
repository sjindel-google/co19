/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form identical(e1 , e2 ) where e1 and e2 are
 * constant expressions and identical() is the predefined dart function that returns
 * true iff its two arguments are the same object.
 * @description Checks that if identical() is redefined, its invocation is not a constant expressions.
 * @compile-error
 * @author kaigorodov
 */

bool identical(var a, var b) {
  return a.equals(b);
}

final constList = const [
  identical("a", "b"),
];

main() {
  Expect.isTrue(constList is List);
}
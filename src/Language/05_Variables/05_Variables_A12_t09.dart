/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration of one of the forms
 * T v;, T v = e; , const T v = e;, ﬁnal T v; or ﬁnal T v = e;
 * always induces an implicit getter function with signature
 *   T get v
 * @description Checks that the returned type of this implicit getter is the same as the
 * static field's type, by attempting to assign the result of its invocation to a variable
 * of incompatible type. Static warning expected.
 * @author pagolubev
 * @static-warning
 * @reviewer msyabro
 * @reviewer rodionov
 */
import "../../Utils/dynamic_check.dart";

class A {
  static int a = 1;
}

main() {
  checkTypeError(() {
    bool a = A.a;
  });
}
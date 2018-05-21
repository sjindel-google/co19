/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object, dynamic, or void).
 * @description Check that a type T0 is a subtype of a type T1, if T1 is Object.
 * Class CompareTypes<X extends Y, Y> {} is used to check assertion.
 * @author ngl@unipro.ru
 */

class A {
}
class B extends A {
}
class CompareTypes<X extends Y, Y> {}

main() {
  new CompareTypes<num, Object>();
  new CompareTypes<B, Object>();
  new CompareTypes<A, Object>();
  new CompareTypes<Null, Object>();
  new CompareTypes<dynamic, Object>();
  new CompareTypes<void, Object>();
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if T0 and T1 are the same type then T0 is a subtype
 * of a type T1
 * @author sgrekhov@unipro.ru
 */

abstract class A {
}

class B extends A {
}

main() {
  A a1 = new B();
  B b1 = new B();
  b1 = a1;

  A a2 = new B();
  B b2 = new B();
  a2 = b2;
}

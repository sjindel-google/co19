/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The mixin introduced by a mixin declaration contains all the
 * non-static members declared by the mixin, just as the mixin derived from a
 * class declaration currently does.
 *
 * @description Checks that a mixin declaration doesn't contain the static
 * members declared in super interfaces. Static members from supertypes must be
 * qualified by the name of the defining type.
 * @compile-error
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

class I {
  static int i1 = 1;
}
class J {
  static int j1 = 2;
}

class B {
  static int b1 = 3;
}
class C {
  static int c1 = 4;
}

mixin M on B, C implements I, J {
}

class MA with M {
  test() {
    Expect.isTrue(i1 == 1); //# 01: compile-time error
    Expect.isTrue(j1 == 2); //# 02: compile-time error
    Expect.isTrue(b1 == 3); //# 03: compile-time error
    Expect.isTrue(c1 == 4); //# 04: compile-time error
  }
}

main() {
  MA ma = new MA();
  ma.test();
}

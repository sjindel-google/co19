/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a mixin declaration like mixin A<X extends S, Y extends T>
 * on B, C implements D, E { body } the on clause declares the interfaces B and
 * C as super-class constraints of the mixin. Having a super-class constraint
 * allows the mixin declaration instance members to perform super-invocations
 * (like super.foo()) if they are allowed by a class implementing both B and C.
 *
 * @description Checks that a mixin declaration can perform super-invocations.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

class I {}
class J {}

class B {
  int get b1 => 3;
}
class C {
  int get c1 => 4;
}

mixin M on B, C implements I, J {
  test() {
    Expect.isTrue(M$super.b1 == 3);
    Expect.isTrue(M$super.c1 == 4);
  }
}

class MA with M {
  int get b1 => 13;
  int get c1 => 14;
}

main() {
  MA ma = new MA();
  Expect.isTrue(ma.b1 == 13);
  Expect.isTrue(ma.c1 == 14);
  ma.test();
}

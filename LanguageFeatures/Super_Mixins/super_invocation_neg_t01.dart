/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It's a compile-time error if an instance method in a mixin body
 * has a super-access (super.foo, super.foo(), super + bar, etc.) which would
 * not be a valid invocation if super was replaced by an expression with static
 * type A$super.
 *
 * @description Checks that it is a compile error if an instance method in a
 * mixin body has a super-access (super.foo, super.foo(), super + bar, etc.)
 * which would not be a valid invocation if super was replaced by an expression
 * with static type A$super.
 * @compile_error
 * @author ngl@unipro.ru
 */

class I {
  int i1 = 1;
}
class J {
  int get gi => 2;
}

class B {
  int f() => 3;
}
class C {
  int i;
  set si(p) => i = p;
}

mixin M on B, C implements I, J {
  test() {
    super.i1 == 1;   //# 01: compile-time error
    super.gi == 2;   //# 02: compile-time error
    super.f() == 3;  //# 03: compile-time error
    super.si(4);  //# 04: compile-time error
  }
}

class MA with M {
  int i1 = 11;
  int get gi => 12;
  int f() => 13;
  int i;
  set si(p) => i = p;
}

main() {
  MA ma = new MA();
  ma.test();
}

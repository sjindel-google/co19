/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test local variable assignment
 * @author sgrekhov@unipro.ru
 */
int init() => 2;

class C {

  static void staticMethod() {
    double s1 = init();     //# 01: compile-time error
  }

  void instanceMethod() {
    double m1 = init();     //# 02: compile-time error
  }
}

void foo() {
  double l1 = init();       //# 03: compile-time error
}

main() {
  double d1 = init();       //# 04: compile-time error

  void bar() {
    double b1 = init();     //# 05: compile-time error
  }

  foo();
  bar();
  C.staticMethod();
  new C().instanceMethod();
}

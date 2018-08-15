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

class C {

  static void staticMethod() {
    double s1 = 42;
    double s2 = (3 > 2 ? 2 : 3);
    const double s3 = -42;
    final double s4 = 23;

    s1 = -42;
    s2 = 42;
  }

  void instanceMethod() {
    double m1 = 42;
    double m2 = (3 > 2 ? 2 : 3);
    const double m3 = -42;
    final double m4 = 23;

    m1 = -42;
    m2 = 42;
  }
}

void foo() {
  double l1 = 42;
  double l2 = (3 > 2 ? 2 : 3);
  const double l3 = -42;
  final double l4 = 23;

  l1 = -42;
  l2 = 42;
}

main() {
  double d1 = 42;
  double d2 = (3 > 2 ? 2 : 3);
  const double d3 = -42;
  final double d4 = 23;

  d1 = -42;
  d2 = 42;

  foo();
  C.staticMethod();
  new C().instanceMethod();

  void bar() {
    double b1 = 42;
    double b2 = (3 > 2 ? 2 : 3);
    const double b3 = -42;
    final double b4 = 23;

    b1 = -42;
    b2 = 42;
  }
  bar();
}

/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test local variable assignment and hexadecimal literals
 * @author sgrekhov@unipro.ru
 */

class C {

  static void staticMethod() {
    double s1 = 0x42;
    double s2 = (3 > 2 ? 0x2 : 0x3);
    const double s3 = -0x42;
    final double s4 = 0x23;

    s1 = -0x42;
    s2 = 0x42;
  }

  void instanceMethod() {
    double m1 = 0x42;
    double m2 = (3 > 2 ? 0x2 : 0x3);
    const double m3 = -0x42;
    final double m4 = 0x23;

    m1 = -0x42;
    m2 = 0x42;
  }
}

void foo() {
  double l1 = 0x42;
  double l2 = (3 > 2 ? 0x2 : 0x3);
  const double l3 = -0x42;
  final double l4 = 0x23;

  l1 = -0x42;
  l2 = 0x42;
}

main() {
  double d1 = 0x42;
  double d2 = (3 > 2 ? 0x2 : 0x3);
  const double d3 = -0x42;
  final double d4 = 0x23;

  d1 = -0x42;
  d2 = 0x42;

  foo();
  C.staticMethod();
  new C().instanceMethod();

  void bar() {
    double b1 = 0x42;
    double b2 = (3 > 2 ? 0x2 : 0x3);
    const double b3 = -0x42;
    final double b4 = 0x23;

    b1 = -0x42;
    b2 = 0x42;
  }
  bar();
}

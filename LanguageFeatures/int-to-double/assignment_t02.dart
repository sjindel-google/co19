/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test assignment expression and hexadecimal integer literals
 * @author sgrekhov@unipro.ru
 */


class C {
  double m1 = 0x42;
  double m2 = (0x3 > 0x2 ? 0x2 : 0x3);
  static const double m3 = -0x42;
  final double m4 = 0x23;

  static double s = -0x42;

  void set instanceSetter(double val) {
    m1 = val;
  }

  static void set staticSetter(double val) {
    s = val;
  }
}

void foo() {
  double l1 = 0x42;
  double l2 = (0x3 > 0x2 ? 0x2 : 0x3);
  const double l3 = -0x42;
  final double l4 = 0x23;
}

double g1 = 0x42;
double g2 = (0x3 > 0x2 ? 0x2 : 0x3);
const double g3 = -0x42;
final double g4 = 0x23;


main() {
  double d1 = 0x42;
  double d2 = (0x3 > 0x2 ? 0x2 : 0x3);
  const double d3 = -0x42;
  final double d4 = 0x23;

  g1 = -0x42;
  g2 = 0x42;

  C.c = 0x23;
  C.staticSetter = -0x23;

  C c = C();
  c.m1 = 0x23;
  c.instanceSetter = -0x23;

  foo();

  void bar() {
    double b1 = 0x42;
    double b2 = (0x3 > 0x2 ? 0x2 : 0x3);
    const double b3 = -0x42;
    final double b4 = 0x23;
  }

  bar();
}

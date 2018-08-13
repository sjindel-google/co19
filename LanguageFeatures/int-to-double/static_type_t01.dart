/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test assignment expression
 * @author sgrekhov@unipro.ru
 */


class C {
  double m1 = 42;
  double m2 = (3 > 2 ? 2 : 3);
  static const double m3 = -42;
  final double m4 = 23;

  static double s = -42;

  void set instanceSetter(double val) {
    m1 = val;
  }

  static void set staticSetter(double val) {
    s = val;
  }
}

void foo() {
  double l1 = 42;
  double l2 = (3 > 2 ? 2 : 3);
  const double l3 = -42;
  final double l4 = 23;
}

double g1 = 42;
double g2 = (3 > 2 ? 2 : 3);
const double g3 = -42;
final double g4 = 23;


main() {
  double d1 = 42;
  double d2 = (3 > 2 ? 2 : 3);
  const double d3 = -42;
  final double d4 = 23;

  C.c = 23;
  C.staticSetter = -23;

  C c = C();
  c.m1 = 23;
  c.instanceSetter = -23;

  foo();
}

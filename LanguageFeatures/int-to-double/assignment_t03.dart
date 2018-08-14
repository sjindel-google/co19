/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test assignment expression and generic routine
 * @author sgrekhov@unipro.ru
 */


class C<X, Y extends num> {
  X x;
  Y y;

  void set setterX(X val) {}
  void set setterY(Y val) {}
}

X foo<X>(X x) => x;

main() {
  C<double, double> c = new C<double, double>();
  c.x = 42;
  c.y = -42;
  c.x = 0x42;
  c.y = -0x42;
  c.setterX = 42;
  c.setterY = -42;
  c.setterX = 0x42;
  c.setterY = -0x42;

  c.x = foo(-42);
  c.y = foo(42);
  c.x = foo(-0x42);
  c.y = foo(0x42);
  c.setterX = foo(42);
  c.setterY = foo(-42);
  c.setterX = foo(0x42);
  c.setterY = foo(-0x42);

  c.x = foo<double>(-42);
  c.y = foo<double>(42);
  c.x = foo<double>(-0x42);
  c.y = foo<double>(0x42);
  c.setterX = foo<double>(42);
  c.setterY = foo<double>(-42);
  c.setterX = foo<double>(0x42);
  c.setterY = foo<double>(-0x42);
}

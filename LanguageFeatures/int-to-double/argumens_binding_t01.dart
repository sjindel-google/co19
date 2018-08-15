/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test arguments binding
 * @author sgrekhov@unipro.ru
 */

class C {
  static void staticMethod(double val) {}
  static void staticMethodPos(double val, [double pos]) {}
  static void staticMethodNam(double val, {double nam}) {}

  void instanceMethod(double val) {}
  void instanceMethodPos(double val, [double pos]) {}
  void instanceMethodNam(double val, {double nam}) {}
}

void foo(double x) {}

void positional1(double d1, [double d2]) {}
void positional2(dynamic x1, [double d2]) {}

void named1(double d1, {double d2}) {}
void named2(dynamic x1, {double d2}) {}

main() {
  C.staticMethod(42);
  C.staticMethod(0x42);
  C.staticMethodPos(42);
  C.staticMethodPos(0x42);
  C.staticMethodPos(42.0, 42);
  C.staticMethodPos(42.0 0x42);
  C.staticMethodNam(42);
  C.staticMethodNam(0x42);
  C.staticMethodNam(42.0, nam: 42);
  C.staticMethodNam(42.0, nam: 0x42);

  C c = C();
  c.instanceMethod(42);
  c.instanceMethod(0x42);
  c.instanceMethodPos(42);
  c.instanceMethodPos(0x42);
  c.instanceMethodPos(42.0, 42);
  c.instanceMethodPos(42.0, 0x42);
  c.instanceMethodNam(42);
  c.instanceMethodNam(0x42);
  c.instanceMethodNam(42.0, nam: 42);
  c.instanceMethodNam(42.0, nam: 0x42);

  foo(42);
  foo(0x42);

  positional1(42);
  positional1(42.0, 42);
  positional2(42, 42);
  positional1(0x42);
  positional1(42.0, 0x42);
  positional2(42, 0x42);

  named1(42);
  named1(42.0, d2: 42);
  named2(42, d2: 42);
  named1(0x42);
  named1(42.0, d2: 0x42);
  named2(0x42, d2: 0x42);

  void bar(double x) {}
  void barPos(double x, [double d2]) {}
  void barNam(double x, {double d2}) {}

  bar(42);
  bar(0x42);
  barPos(42);
  barPos(0x42);
  barPos(42.0, 42);
  barPos(42.0, 0x42);
  barNam(42);
  barNam(0x42);
  barNam(42.0, d2: 42);
  barNam(42.0, d2: 0x42);
}

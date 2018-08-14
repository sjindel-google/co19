/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test return value
 * @author sgrekhov@unipro.ru
 */


class C {

  double get instanceGetter => 42;
  static double get staticGetter => -42;

  double instanceMethod() => 42;
  static double staticMethod() => -42;
}

double foo() => 42;

main() {
  double bar() => 42;

  foo();
  bar();
  C.staticGetter;
  C.staticMethod();

  C c = C();
  c.instanceGetter;
  c.instanceMethod();
}

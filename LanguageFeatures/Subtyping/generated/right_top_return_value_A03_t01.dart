/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object, dynamic, or void)
 * @description Check that if type T1 is a void then instance of
 * T0 can be assigned to the T1 variable.
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

class T0 {}

void getVoid() {}

T0 t0Instance = new T0();
var t1Instance = getVoid();




void returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static void staticTestMethod() => forgetType(t0Instance);

  void testMethod() => forgetType(t0Instance);

  void get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  void returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  new ReturnValueGen<T0>().testMethod();
  new ReturnValueGen<T0>().testGetter;
}

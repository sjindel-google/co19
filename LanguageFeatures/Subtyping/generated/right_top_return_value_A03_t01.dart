/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object, dynamic, or void)
 * @description Check that if type T1 is an Object and T0 is a dynamic then
 * T0 is a subtype of a type T1.
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

dynamic t0Instance = "";
Object t1Instance = new Object();




Object returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static Object staticTestMethod() => forgetType(t0Instance);

  Object testMethod() => forgetType(t0Instance);

  Object get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  Object returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  new ReturnValueGen<dynamic>().testMethod();
  new ReturnValueGen<dynamic>().testGetter;
}

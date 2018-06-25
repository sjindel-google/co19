/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if type T1 and T0 are both dynamic then T0 is a
 * subtype of a type T1
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

dynamic t0Instance = 3.14;
dynamic t1Instance = "";




dynamic returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static dynamic staticTestMethod() => forgetType(t0Instance);

  dynamic testMethod() => forgetType(t0Instance);

  dynamic get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  dynamic returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  if (!isGenericFunctionType<dynamic>()) {
    new ReturnValueGen<dynamic>().testMethod();
    new ReturnValueGen<dynamic>().testGetter;
  }
}

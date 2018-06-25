/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Function Type/Function: T0 is a function type and T1 is Function
 * @description Check that if type T0 is a function type and T1 is Function then
 * T0 is a subtype of T1. Test non-void function with required arguments
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

class C {}

typedef C T0(C c);

C t0Instance(C c) => c;
Function t1Instance = null;




Function returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static Function staticTestMethod() => forgetType(t0Instance);

  Function testMethod() => forgetType(t0Instance);

  Function get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  Function returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  if (!isGenericFunctionType<Function>()) {
    new ReturnValueGen<T0>().testMethod();
    new ReturnValueGen<T0>().testGetter;
  }
}

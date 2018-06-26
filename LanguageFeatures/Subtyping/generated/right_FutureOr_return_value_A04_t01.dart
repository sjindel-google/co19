/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right FutureOr: T1 is FutureOr<S1> and
 *   either T0 <: Future<S1>
 *   or T0 <: S1
 *   or T0 is X0 and X0 has bound S0 and S0 <: T1
 *   or T0 is X0 & S0 and S0 <: T1
 * @description Check that if a type T1 is S1 and a type T0 is X0 and X0 has
 * bound S0 and S0 <: S1, then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "../utils/common.dart";

class S1 {}
class S0 extends S1 {
}
class X0 extends S0 {
}

X0 t0Instance = new X0();
S1 t1Instance = new S1();




S1 returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static S1 staticTestMethod() => forgetType(t0Instance);

  S1 testMethod() => forgetType(t0Instance);

  S1 get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  S1 returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  // Generic function types cannot be used as a type parameter, so test
  // generics only if it is not a generic function type and in a separate
  // function to avoid compile-time error
  if (!isGenericFunctionType) {
    testGenerics();
  }
}

void testGenerics() {
  new ReturnValueGen<S1>().testMethod();
  new ReturnValueGen<S1>().testGetter;
}

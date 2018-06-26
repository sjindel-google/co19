/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left FutureOr: T0 is FutureOr<S0>
 *   and Future<S0> <: T1
 *   and S0 <: T1
 * @description Check that if a type T0 is FutureOr<S0> and Future<S0> and S0
 * are subtypes of a type T1, then a type T0 is a subtype of a type T1. Case
 * when an instance of T0 is an instance of Future<S0> type.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../utils/common.dart";

class C1 {}
class S0 extends C1 {}

FutureOr<S0> t0Instance = new Future.value(new S0());
FutureOr<C1> t1Instance = new Future.value(new C1());




FutureOr<C1> returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static FutureOr<C1> staticTestMethod() => forgetType(t0Instance);

  FutureOr<C1> testMethod() => forgetType(t0Instance);

  FutureOr<C1> get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  FutureOr<C1> returnValueLocalFunc() => forgetType(t0Instance);

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
  new ReturnValueGen<FutureOr<C1>>().testMethod();
  new ReturnValueGen<FutureOr<C1>>().testGetter;
}

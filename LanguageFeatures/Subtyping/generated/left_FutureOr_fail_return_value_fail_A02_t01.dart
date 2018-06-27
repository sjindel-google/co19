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
 * @description Check that if a type T0 is FutureOr<S0> and S0 is a subtype of
 * T1 but Future<S0> is not a subtype of T1 , then a type T0 is not a subtype of
 * a type T1.
 * @author sgrekhov@unipro.ru
 */

import "dart:async";
import "../utils/common.dart";
import "../../../Utils/expect.dart";

class T1 {}
class S0 extends T1 {}

FutureOr<S0> t0Instance = Future<S0>.value(new S0()); // Future<S0> is not a subtype of T1
T1 t1Instance = new T1();




T1 returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static T1 staticTestMethod() => forgetType(t0Instance);

  T1 testMethod() => forgetType(t0Instance);

  T1 get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}

main() {
  T1 returnValueLocalFunc() => forgetType(t0Instance);

  Expect.throws(() {returnValueFunc();}, (e) => e is TypeError);
  Expect.throws(() {returnValueLocalFunc();}, (e) => e is TypeError);
  Expect.throws(() {ReturnValueTest.staticTestMethod();}, (e) => e is TypeError);

  Expect.throws(() {new ReturnValueTest().testMethod();}, (e) => e is TypeError);
  Expect.throws(() {new ReturnValueTest().testGetter;}, (e) => e is TypeError);

  // Generic function types cannot be used as a type parameter, so test
  // generics only if it is not a generic function type and in a separate
  // function to avoid compile-time error
  if (!isGenericFunctionType) {
    testGenerics();
  }
}

void testGenerics() {
  Expect.throws(() {new ReturnValueGen<T1>().testMethod();}, (e) => e is TypeError);
  Expect.throws(() {new ReturnValueGen<T1>().testGetter;}, (e) => e is TypeError);
}

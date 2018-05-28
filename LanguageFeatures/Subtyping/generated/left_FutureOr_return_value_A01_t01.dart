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
 * are subtypes of a type T1, then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "../utils/common.dart";


class T1 {}

class S0 extends T1 {}
class Future<S0> extends T1 {}
class FutureOr<S0> {}

FutureOr<S0> t0Instance = new FutureOr<S0>();
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

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  new ReturnValueGen<FutureOr<S0>>().testMethod();
  new ReturnValueGen<FutureOr<S0>>().testGetter;
}

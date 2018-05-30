/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * ype Variable Reflexivity 1: T0 is a type variable X0 or a promoted type
 * variables X0 & S0 and T1 is X0.
 * @description Check that if a type T0 is a promoted type variables X0 & S0
 * and T1 is X0, then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "../utils/common.dart";


class X0 {}
class S0 extends X0 {}
class C<T> {}


C<S0> t0Instance = new C<S0>();
C<X0> t1Instance = new C<X0>();





C<X0> returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static C<X0> staticTestMethod() => forgetType(t0Instance);

  C<X0> testMethod() => forgetType(t0Instance);

  C<X0> get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  C<X0> returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  new ReturnValueGen<C<S0>>().testMethod();
  new ReturnValueGen<C<S0>>().testGetter;
}

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
 * when an instance of T0 is an instance of S0 type and S0 is a generic type
 * @author sgrekhov@unipro.ru
 */

import "dart:async";
import "../utils/common.dart";

class A {}
class B extends A {}
class C<X> {}
class S0<X> extends C<X> {}

FutureOr<S0<B>> t0Instance = new S0<B>();
FutureOr<C<A>> t1Instance = new Future<C<A>>.value(new C());




FutureOr<C<A>> returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static FutureOr<C<A>> staticTestMethod() => forgetType(t0Instance);

  FutureOr<C<A>> testMethod() => forgetType(t0Instance);

  FutureOr<C<A>> get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  FutureOr<C<A>> returnValueLocalFunc() => forgetType(t0Instance);

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
  new ReturnValueGen<FutureOr<C<A>>>().testMethod();
  new ReturnValueGen<FutureOr<C<A>>>().testGetter;
}

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
 * @description Check that if a type T1 is Future<S1> and a type T0 is X0 and
 * X0 has bound S0 and S0 is not a subtype of Future<S1> or S1, then a type T0
 * is not a subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../utils/common.dart";
import "../../../Utils/expect.dart";

class S1 {}
class S0 {}
class X0 extends S0 {
}

X0 t0Instance = new X0();
FutureOr<S1> t1Instance = new Future.value(new S1());




FutureOr<S1> returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static FutureOr<S1> staticTestMethod() => forgetType(t0Instance);

  FutureOr<S1> testMethod() => forgetType(t0Instance);

  FutureOr<S1> get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}

main() {
  FutureOr<S1> returnValueLocalFunc() => forgetType(t0Instance);

  Expect.throws(() {returnValueFunc();}, (e) => e is TypeError);
  Expect.throws(() {returnValueLocalFunc();}, (e) => e is TypeError);
  Expect.throws(() {ReturnValueTest.staticTestMethod();}, (e) => e is TypeError);

  Expect.throws(() {new ReturnValueTest().testMethod();}, (e) => e is TypeError);
  Expect.throws(() {new ReturnValueTest().testGetter;}, (e) => e is TypeError);

  Expect.throws(() {new ReturnValueGen<FutureOr<S1>>().testMethod();}, (e) => e is TypeError);
  Expect.throws(() {new ReturnValueGen<FutureOr<S1>>().testGetter;}, (e) => e is TypeError);
}

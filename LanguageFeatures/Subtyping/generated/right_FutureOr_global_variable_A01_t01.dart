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
 * @description Check that if a type T1 is FutureOr<S1> and a type T0 is a
 * subtype of a type Future<S1>, then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../utils/common.dart";

class S1 {}
class T0 extends Future<S1> {
  factory T0(FutureOr<S1> computation()) =>  computation();
  asStream() => new Stream.fromFuture(new Completer().future);
  catchError(Function onError, { bool test(Object error) }) => onError();
  then<T0>(FutureOr<T0> onValue(S1 value), { Function onError }) =>
      onValue(new S1());
  timeout(Duration timeLimit, { FutureOr<S1> onTimeout() }) => onTimeout();
  whenComplete(FutureOr action()) => action();
}

FutureOr computation() async => new S1();

T0 t0Instance = new T0(computation());
FutureOr<S1> t1Instance = new Future.value(new S1());




class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = forgetType(t0Instance);
  }

  foo() {
    t1Instance = forgetType(t0Instance);
  }

  static test() {
    t1Instance = forgetType(t0Instance);
  }
}

main() {
  bar () {
    t1Instance = forgetType(t0Instance);
  }

  t1Instance = forgetType(t0Instance);
  bar();
  GlobalVariableTest t = new GlobalVariableTest();
  t.foo();
  GlobalVariableTest.test();
}

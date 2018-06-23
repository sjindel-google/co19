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

import "dart:async";
import "../utils/common.dart";

class C1 {}
class S0 implements Future<C1> {
  asStream() => null;
  catchError(Function onError, {bool test(Object error)}) => null;
  then<S0>(FutureOr<S0> onValue(C1 value), {Function onError}) => null;
  timeout(Duration timeLimit, {FutureOr<C1> onTimeout()}) => null;
  whenComplete(FutureOr action()) => null;
}

FutureOr<S0> t0Instance = new S0();
Future<C1> t1Instance = new Future.value(new C1());




class LocalVariableTest {

  LocalVariableTest() {
    Future<C1> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  static staticTest() {
    Future<C1> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  test() {
    Future<C1> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }
}

main() {
  foo() {
    Future<C1> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  Future<C1> t1 = forgetType(t0Instance);
  t1 = forgetType(t0Instance);
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}

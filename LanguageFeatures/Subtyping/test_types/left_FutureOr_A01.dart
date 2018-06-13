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
class C0 extends C1 {}
class S0 extends Future<C1> {
  factory S0(FutureOr<C1> computation()) =>  computation();
  asStream() => new Stream.fromFuture(new Completer().future);
  catchError(Function onError, { bool test(Object error) }) => onError();
  then<S0>(FutureOr<S0> onValue(C0 value), { Function onError }) =>
      onValue(new C0());
  timeout(Duration timeLimit, { FutureOr<C1> onTimeout() }) => onTimeout();
  whenComplete(FutureOr action()) => action();
}

FutureOr computation() async => new C1();

FutureOr<S0> t0Instance = new S0(computation());
Future<C0> t1Instance = new Future.value(new C0());

//# @T0 = FutureOr<S0>
//# @T1 = Future<C1>

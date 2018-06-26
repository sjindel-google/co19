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
 * @description Check that if a type T0 is FutureOr<S0> and Future<S0> is a
 * subtype of T1 and S0 is not a subtype of a type T1, then a type T0 is not a
 * subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../utils/common.dart";
import "../../../Utils/expect.dart";

class S0 {}

FutureOr<S0> t0Instance = new S0();
Future<S0> t1Instance = new Future.value(new S0());




class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = forgetType(t0Instance);
  }

  GlobalVariableTest.valid() {}

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

  Expect.throws(() {
    t1Instance = forgetType(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    bar();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new GlobalVariableTest();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new GlobalVariableTest.valid().foo();
  }, (e) => e is TypeError);

  Expect.throws(() {
    GlobalVariableTest.test();
  }, (e) => e is TypeError);
}

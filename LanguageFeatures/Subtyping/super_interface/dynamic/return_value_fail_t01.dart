/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Super-Interface: T0 is an interface type with super-interfaces S0,...Sn
 * - and Si <: T1 for some i
 * @description Check that if type T0 is an interface type with super-interfaces
 * S0,...Sn and and Si <: T1 for some i then instance of T0 can be assigned to
 * the T1 variable. Test that if there is no i, such that Si <: T1, then T0
 * is not subtype of T1
 * @author sgrekhov@unipro.ru
 */
import "../../../../Utils/expect.dart";
import "return_value_lib.dart" as l;

class T1 {}

abstract class S0 {}
abstract class S1 {}
abstract class S2 {}

abstract class T0 implements S0, S1, S2  {}

class T implements T0 {}

dynamic forgetType(dynamic d) => d;

T1 f1(dynamic t) => forgetType(t);
T1 f2({dynamic t}) => forgetType(t);
T1 f3([dynamic t]) => forgetType(t);

main() {
  T0 t0 = new T();
  Expect.throws(() {f1(t0);}, (e) => e is TypeError);
  Expect.throws(() {f2(t: t0);}, (e) => e is TypeError);
  Expect.throws(() {f3(t0);}, (e) => e is TypeError);
  Expect.throws(() {l.f(t0);}, (e) => e is TypeError);

  Expect.throws(() {f1("");}, (e) => e is TypeError);
  Expect.throws(() {f2(t: "");}, (e) => e is TypeError);
  Expect.throws(() {f3("");}, (e) => e is TypeError);
  Expect.throws(() {l.f("");}, (e) => e is TypeError);
}

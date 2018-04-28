/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is not a subtype of a type T1
 * @description Check that if type T0 not a subtype of a type T1, then instance
 * of T0 cannot be be used as a return value of type T1
 * @author sgrekhov@unipro.ru
 */
part of co19_subtype_tests;

T1 f1(dynamic t) => forgetType(t);
T1 f2({dynamic t}) => forgetType(t);
T1 f3([dynamic t]) => forgetType(t);

testReturnValueFail() {
  T0 t0 = new T();
  Expect.throws(() {f1(t0);}, (e) => e is TypeError);
  Expect.throws(() {f2(t: t0);}, (e) => e is TypeError);
  Expect.throws(() {f3(t0);}, (e) => e is TypeError);

  Expect.throws(() {f1("");}, (e) => e is TypeError);
  Expect.throws(() {f2(t: "");}, (e) => e is TypeError);
  Expect.throws(() {f3("");}, (e) => e is TypeError);
}

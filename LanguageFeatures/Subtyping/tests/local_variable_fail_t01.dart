/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the to local variable of type T1
 * @author sgrekhov@unipro.ru
 */
part of co19_subtype_tests;

class LocalVariableTest {

  LocalVariableTest() {
    T1 t1 = null;
    t1 = forgetType(t0Instance);
  }

  LocalVariableTest.valid() {}

  static staticTest() {
    T1 t1 = null;
    t1 = forgetType(t0Instance);
  }

  test() {
    T1 t1 = null;
    t1 = forgetType(t0Instance);
  }
}

testLocalVariableFail() {
  bar () {
    T1 t1 = null;
    t1 = forgetType(t0Instance);
  }

  Expect.throws(() {
    T1 t1 = null;
    t1 = forgetType(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    bar();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new LocalVariableTest();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new LocalVariableTest.valid().test();
  }, (e) => e is TypeError);

  Expect.throws(() {
    LocalVariableTest.staticTest();
  }, (e) => e is TypeError);
}

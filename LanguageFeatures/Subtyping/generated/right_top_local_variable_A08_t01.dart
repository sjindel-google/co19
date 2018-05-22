/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object, dynamic, or void)
 * @description Check that if type T1 is an Object and T0 is a void then
 * instance of T0 can be used as T1 variable.
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

void getVoid() {}

var t0Instance = getVoid();
Object t1Instance = new Object();




class LocalVariableTest {

  LocalVariableTest() {
    Object t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  static staticTest() {
    Object t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  test() {
    Object t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }
}

main() {
  foo() {
    Object t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  Object t1 = forgetType(t0Instance);
  t1 = forgetType(t0Instance);
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}

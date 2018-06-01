/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if type T1 and T0 are both Object then T0 is a
 * subtype of a type T1
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

Object t0Instance = new Object();
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

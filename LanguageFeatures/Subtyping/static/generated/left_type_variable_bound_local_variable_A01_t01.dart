/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Type Variable Bound: T0 is a type variable X0 with bound B0
 *   and B0 <: T1
 * @description Check that if T0 is a type variable X0 with bound B0 and
 * B0 <: T1 then T0 is a subtype of a type T1
 * @author ngl@unipro.ru
 */
import '../../utils/common.dart';

class T1 {}
class B0 extends T1 {}
class X0 extends B0 {}

X0 t0Instance = new X0();
T1 t1Instance = new T1();




class LocalVariableTest {

  LocalVariableTest() {
    T1 t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    T1 t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    T1 t1 = t0Instance;
    t1 = t0Instance;
  }
}

main() {
  foo() {
    T1 t1 = t0Instance;
    t1 = t0Instance;
  }

  T1 t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}

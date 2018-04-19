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
 * the T1 variable. Test that instance of T0 can assigned to local variable of
 * type T1. S1 extends T1
 * @author sgrekhov@unipro.ru
 */
class T1 {}

abstract class S0 {}
abstract class S1 extends T1 {}
abstract class S2 {}

abstract class T0 implements S0, S1, S2  {}

class T implements T0 {}

dynamic forgetType(dynamic d) => d;

T0 foo(T1 t1) => forgetType(t1);

test() {
  T0 t0 = new T();
  T1 t10 = forgetType(new T());
  T1 t11 = forgetType(t0);
  T1 t12 = foo(t0);
  T1 t13 = foo(new T());
}

class C {

  static staticTest() {
    T0 t0 = new T();
    T1 t10 = forgetType(new T());
    T1 t11 = forgetType(t0);
    T1 t12 = foo(t0);
    T1 t13 = foo(new T());
  }

  test() {
    T0 t0 = new T();
    T1 t10 = forgetType(new T());
    T1 t11 = forgetType(t0);
    T1 t12 = foo(t0);
    T1 t13 = foo(new T());
  }
}

main() {
  T0 t0 = new T();
  T1 t10 = forgetType(new T());
  T1 t11 = forgetType(t0);
  T1 t12 = foo(t0);
  T1 t13 = foo(new T());

  bar() {
    T0 t0 = new T();
    T1 t10 = forgetType(new T());
    T1 t11 = forgetType(t0);
    T1 t12 = foo(t0);
    T1 t13 = foo(new T());
  }

  test();
  new C().test();
  C.staticTest();
  bar();
}

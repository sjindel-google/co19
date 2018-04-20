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
 * the T1 variable. Test that instance of T0 can assigned to a static class
 * member of type T1. S0 extends T1
 * @author sgrekhov@unipro.ru
 */
class T1 {}

abstract class S0 extends T1 {}
abstract class S1 {}
abstract class S2 {}

abstract class T0 implements S0, S1, S2  {}

class T implements T0 {}

dynamic forgetType(dynamic d) => d;

T0 foo(T1 t1) => forgetType(t1);

class C {
  static T1 t10, t11, t12, t13;

  static test() {
    T0 t0 = new T();
    t10 = forgetType(new T());
    t11 = forgetType(t0);
    t12 = foo(t0);
    t13 = foo(new T());
  }

  tst() {
    T0 t0 = new T();
    t10 = forgetType(new T());
    t11 = forgetType(t0);
    t12 = foo(t0);
    t13 = foo(new T());
  }
}

test() {
  T0 t0 = new T();
  C.t10 = forgetType(new T());
  C.t11 = forgetType(t0);
  C.t12 = foo(t0);
  C.t13 = foo(new T());
  C.test();
}

main() {
  T0 t0 = new T();
  C.t10 = forgetType(new T());
  C.t11 = forgetType(t0);
  C.t12 = foo(t0);
  C.t13 = foo(new T());
  C.test();

  bar() {
    T0 t0 = new T();
    C.t10 = forgetType(new T());
    C.t11 = forgetType(t0);
    C.t12 = foo(t0);
    C.t13 = foo(new T());
    C.test();
  }

  test();
  bar();
  new C().tst();
}

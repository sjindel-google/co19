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
 * the T1 variable. Test that instance of T0 can assigned to a class member of
 * type T1. Test the case when Si is not direct child of T1
 * @author sgrekhov@unipro.ru
 */
class T1 {}

abstract class S0 {}
abstract class S1 {}
abstract class S2 extends SS2 {}

class SS2 extends Object with T1 {}

abstract class T0 implements S0, S1, S2  {}

class T implements T0 {}

dynamic forgetType(dynamic d) => d;

T1 foo(T1 t1) => forgetType(t1);

class C1 {
  static staticTest() {
    T0 t0 = new T();
    C1 c1 = new C1();
    c1.t10 = forgetType(new T());
    c1.t11 = forgetType(t0);
    c1.t12 = foo(t0);
    c1.t13 = foo(new T());
    c1.test();

    C2 c2 = new C2<T1>();
    c2.t10 = forgetType(new T());
    c2.t11 = forgetType(t0);
    c2.t12 = foo(t0);
    c2.t13 = foo(new T());
  }

  T1 t10, t11, t12, t13;

  test() {
    T0 t0 = new T();
    t10 = forgetType(new T());
    t11 = forgetType(t0);
    t12 = foo(t0);
    t13 = foo(new T());
  }
}

class C2<X> {
  X t10, t11, t12, t13;
}

test () {
  T0 t0 = new T();
  C1 c1 = new C1();
  c1.t10 = forgetType(new T());
  c1.t11 = forgetType(t0);
  c1.t12 = foo(t0);
  c1.t13 = foo(new T());
  c1.test();

  C2 c2 = new C2<T1>();
  c2.t10 = forgetType(new T());
  c2.t11 = forgetType(t0);
  c2.t12 = foo(t0);
  c2.t13 = foo(new T());
}

main() {
  T0 t0 = new T();
  C1 c1 = new C1();
  c1.t10 = forgetType(new T());
  c1.t11 = forgetType(t0);
  c1.t12 = foo(t0);
  c1.t13 = foo(new T());
  c1.test();

  C2 c2 = new C2<T1>();
  c2.t10 = forgetType(new T());
  c2.t11 = forgetType(t0);
  c2.t12 = foo(t0);
  c2.t13 = foo(new T());

  bar() {
    T0 t0 = new T();
    C1 c1 = new C1();
    c1.t10 = forgetType(new T());
    c1.t11 = forgetType(t0);
    c1.t12 = foo(t0);
    c1.t13 = foo(new T());
    c1.test();

    C2 c2 = new C2<T1>();
    c2.t10 = forgetType(new T());
    c2.t11 = forgetType(t0);
    c2.t12 = foo(t0);
    c2.t13 = foo(new T());
  }

  test();
  bar();
  new C1().test();
  C1.staticTest();
}
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
 * the T1 variable. Test that instance of T0 can be be used as a parameter of
 * type T1. Test the case when Si is not direct child of T1
 * @author sgrekhov@unipro.ru
 */
import "arguments_binding_lib.dart" as l;
class T1 {}

abstract class S0 {}
abstract class S1 {}
abstract class S2 extends SS2 {}

class SS2 extends Object with T1 {}

abstract class T0 implements S0, S1, S2  {}

class T implements T0 {}

dynamic forgetType(dynamic d) => d;

T1 namedArgumentsFunc1(T1 t1, T1 t2, {T1 t3, T1 t4}) => t1;
T1 positionalArgumentsFunc1(T1 t1, T1 t2, [T1 t3, T1 t4]) => t2;

X namedArgumentsFunc2<X>(X t1, X t2, {X t3, X t4}) => t1;
X positionalArgumentsFunc2<X>(X t1, X t2, [X t3, X t4]) => t2;

class C1 {
  static T1 namedArgumentsStaticFunc(T1 t1, T1 t2, {T1 t3, T1 t4}) => t1;
  static T1 positionalArgumentsStaticFunc(T1 t1, T1 t2, [T1 t3, T1 t4]) => t2;

  T1 namedArgumentsFunc(T1 t1, T1 t2, {T1 t3, T1 t4}) => t1;
  T1 positionalArgumentsFunc(T1 t1, T1 t2, [T1 t3, T1 t4]) => t2;
}

class C2<X> {
  X namedArgumentsFunc(X t1, X t2, {X t3, X t4}) => t1;
  X positionalArgumentsFunc(X t1, X t2, [X t3, X t4]) => t2;
}

main() {
  T1 t0 = new T();
  namedArgumentsFunc1(forgetType(t0), forgetType(new T()), t3: forgetType(t0),
      t4: forgetType(new T()));
  positionalArgumentsFunc1(forgetType(t0), forgetType(new T()), forgetType(t0),
      forgetType(new T()));

  namedArgumentsFunc2<T1>(forgetType(t0), forgetType(new T()),
      t3: forgetType(t0), t4: forgetType(new T()));
  positionalArgumentsFunc2<T1>(forgetType(t0), forgetType(new T()),
      forgetType(t0), forgetType(new T()));

  new C1().namedArgumentsFunc(forgetType(t0), forgetType(new T()),
      t3: forgetType(t0), t4: forgetType(new T()));
  new C1().positionalArgumentsFunc(forgetType(t0), forgetType(new T()),
      forgetType(t0), forgetType(new T()));

  C1.namedArgumentsStaticFunc(forgetType(t0), forgetType(new T()),
      t3: forgetType(t0), t4: forgetType(new T()));
  C1.positionalArgumentsStaticFunc(forgetType(t0), forgetType(new T()),
      forgetType(t0), forgetType(new T()));

  new C2<T1>().namedArgumentsFunc(forgetType(t0), forgetType(new T()),
      t3: forgetType(t0), t4: forgetType(new T()));
  new C2<T1>().positionalArgumentsFunc(forgetType(t0), forgetType(new T()),
      forgetType(t0), forgetType(new T()));

  // Now tests the same that above but from a library
  l.T1 l0 = new l.T();
  l.namedArgumentsFunc1(forgetType(l0), forgetType(new l.T()),
      t3: forgetType(l0), t4: forgetType(new l.T()));
  l.positionalArgumentsFunc1(forgetType(l0), forgetType(new l.T()),
      forgetType(l0), forgetType(new l.T()));

  l.namedArgumentsFunc2<l.T1>(forgetType(l0), forgetType(new l.T()),
      t3: forgetType(l0), t4: forgetType(new l.T()));
  l.positionalArgumentsFunc2<l.T1>(forgetType(l0), forgetType(new l.T()),
      forgetType(l0), forgetType(new l.T()));

  new l.C1().namedArgumentsFunc(forgetType(l0), forgetType(new l.T()),
      t3: forgetType(l0), t4: forgetType(new l.T()));
  new l.C1().positionalArgumentsFunc(forgetType(l0), forgetType(new l.T()),
      forgetType(l0), forgetType(new l.T()));

  l.C1.namedArgumentsStaticFunc(forgetType(l0), forgetType(new l.T()),
      t3: forgetType(l0), t4: forgetType(new l.T()));
  l.C1.positionalArgumentsStaticFunc(forgetType(l0), forgetType(new l.T()),
      forgetType(l0), forgetType(new l.T()));

  new l.C2<T1>().namedArgumentsFunc(forgetType(t0), forgetType(new T()),
      t3: forgetType(t0), t4: forgetType(new T()));
  new l.C2<T1>().positionalArgumentsFunc(forgetType(t0), forgetType(new T()),
      forgetType(t0), forgetType(new T()));
}

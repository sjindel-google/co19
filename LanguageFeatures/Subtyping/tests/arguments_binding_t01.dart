/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1
 * @author sgrekhov@unipro.ru
 */
part of co19_subtype_tests;

namedArgumentsFunc1(T1 t1, {T1 t2}) {}
positionalArgumentsFunc1(T1 t1, [T1 t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingTestClass1 {
  static namedArgumentsStaticMethod(T1 t1, {T1 t2}) {}
  static positionalArgumentsStaticMethod(T1 t1, [T1 t2]) {}

  namedArgumentsMethod(T1 t1, {T1 t2}) {}
  positionalArgumentsMethod(T1 t1, [T1 t2]) {}
}

class ArgumentsBindingTestClass2<X> {
  namedArgumentsMethod(X t1, {X t2}) {}
  positionalArgumentsMethod(X t1, [X t2]){}
}

testArgumentBinding() {
  namedArgumentsFunc1(forgetType(t0Instance), t2: forgetType(t0Instance));
  positionalArgumentsFunc1(forgetType(t0Instance), forgetType(t0Instance));

  namedArgumentsFunc2<T1>(forgetType(t0Instance), t2: forgetType(t0Instance));
  positionalArgumentsFunc2<T1>(forgetType(t0Instance), forgetType(t0Instance));

  new ArgumentsBindingTestClass1().namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  new ArgumentsBindingTestClass1().positionalArgumentsMethod(
      forgetType(t0Instance), forgetType(t0Instance));

  ArgumentsBindingTestClass1.namedArgumentsStaticMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  ArgumentsBindingTestClass1.positionalArgumentsStaticMethod(
      forgetType(t0Instance), forgetType(t0Instance));

  new ArgumentsBindingTestClass2<T1>().namedArgumentsMethod(
      forgetType(t0Instance), t2: forgetType(t0Instance));
  new ArgumentsBindingTestClass2<T1>().positionalArgumentsMethod(
      forgetType(t0Instance), forgetType(t0Instance));
}

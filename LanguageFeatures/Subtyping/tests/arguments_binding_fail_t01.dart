/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is not a subtype of a type T1
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1
 * @author sgrekhov@unipro.ru
 */
part of co19_subtype_tests;

T1 namedArgumentsFunc1(T1 t1, {T1 t2}) => t1;
T1 positionalArgumentsFunc1(T1 t1, [T1 t2]) => t2;

class C {
  static T1 namedArgumentsStaticFunc(T1 t1, {T1 t2}) => t1;
  static T1 positionalArgumentsStaticFunc(T1 t1, [T1 t2]) => t1;

  T1 namedArgumentsFunc(T1 t1, {T1 t2}) => t1;
  T1 positionalArgumentsFunc(T1 t1, [T1 t2]) => t1;
}

testArgumentBindingFail() {
  T0 t0 = new T();
  T1 t1 = new T1();

  // Test functions
  Expect.throws(() {
    namedArgumentsFunc1(forgetType(t0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    namedArgumentsFunc1(t1, t2: forgetType(t0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc1(forgetType(t0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc1(t1, forgetType(t0));
  }, (e) => e is TypeError);

  // Test instance methods
  Expect.throws(() {
    new C().namedArgumentsFunc(forgetType(t0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new C().namedArgumentsFunc(t1, t2: forgetType(t0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new C().positionalArgumentsFunc(forgetType(t0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new C().positionalArgumentsFunc(t1, forgetType(t0));
  }, (e) => e is TypeError);

  // Test static methods
  Expect.throws(() {
    C.namedArgumentsStaticFunc(forgetType(t0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    C.namedArgumentsStaticFunc(t1, t2: forgetType(t0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    C.positionalArgumentsStaticFunc(forgetType(t0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    C.positionalArgumentsStaticFunc(t1, forgetType(t0));
  }, (e) => e is TypeError);
}

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
 * type T1. Test that if there is no i, such that Si <: T1, then T0
 * is not subtype of T1
 * @author sgrekhov@unipro.ru
 */
import "arguments_binding_lib.dart" as l;
import "../../../../Utils/expect.dart";

class T1 {}

abstract class S0 {}
abstract class S1 {}
abstract class S2 {}

abstract class T0 implements S0, S1, S2  {}

class T implements T0 {}

dynamic forgetType(dynamic d) => d;

T1 namedArgumentsFunc1(T1 t1, {T1 t2}) => t1;
T1 positionalArgumentsFunc1(T1 t1, [T1 t2]) => t2;

class C {
  static T1 namedArgumentsStaticFunc(T1 t1, {T1 t2}) => t1;
  static T1 positionalArgumentsStaticFunc(T1 t1, [T1 t2]) => t1;

  T1 namedArgumentsFunc(T1 t1, {T1 t2}) => t1;
  T1 positionalArgumentsFunc(T1 t1, [T1 t2]) => t1;
}

main() {
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


  // Test library functions
  l.T2 l0 = new l.T2();
  l.T1 l1 = new l.T1();

  Expect.throws(() {
    l.namedArgumentsFunc3(forgetType(l0));
  }, (e) => e is TypeError);
  Expect.throws(() {
    l.namedArgumentsFunc3(l1, t2: forgetType(l0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    l.positionalArgumentsFunc3(forgetType(l0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    l.positionalArgumentsFunc3(l1, forgetType(l0));
  }, (e) => e is TypeError);

  // Test library class methods
  Expect.throws(() {
    new l.C3().namedArgumentsFunc(forgetType(l0));
  }, (e) => e is TypeError);
  Expect.throws(() {
    new l.C3().namedArgumentsFunc(l1, t2: forgetType(l0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new l.C3().positionalArgumentsFunc(forgetType(l0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new l.C3().positionalArgumentsFunc(l1, forgetType(l0));
  }, (e) => e is TypeError);

  // Test library class static methods
  Expect.throws(() {
    l.C3.namedArgumentsStaticFunc(forgetType(l0));
  }, (e) => e is TypeError);
  Expect.throws(() {
    l.C3.namedArgumentsStaticFunc(l1, t2: forgetType(l0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    l.C3.positionalArgumentsStaticFunc(forgetType(l0));
  }, (e) => e is TypeError);

  Expect.throws(() {
    l.C3.positionalArgumentsStaticFunc(l1, forgetType(l0));
  }, (e) => e is TypeError);
}

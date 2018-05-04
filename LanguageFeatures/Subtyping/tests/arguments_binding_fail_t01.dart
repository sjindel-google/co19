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

namedArgumentsFunc1(T1 t1, {T1 t2}) {}
positionalArgumentsFunc1(T1 t1, [T1 t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingClass1 {
  ArgumentsBindingClass1(T1 t1) {}

  ArgumentsBindingClass1.named(T1 t1, {T1 t2}) {}
  ArgumentsBindingClass1.positional(T1 t1, [T1 t2]) {}

  static namedArgumentsStaticMethod(T1 t1, {T1 t2}) {}
  static positionalArgumentsStaticMethod(T1 t1, [T1 t2]) {}

  namedArgumentsMethod(T1 t1, {T1 t2}) {}
  positionalArgumentsMethod(T1 t1, [T1 t2]) {}

  set testSetter(T1 val) {}
}

class ArgumentsBindingClass2<X> {
  ArgumentsBindingClass2(X t1) {}

  ArgumentsBindingClass2.named(X t1, {X t2}) {}
  ArgumentsBindingClass2.positional(X t1, [X t2]) {}

  namedArgumentsMethod(X t1, {X t2}) {}
  positionalArgumentsMethod(X t1, [X t2]){}

  set testSetter(X val) {}
}

testArgumentBindingFail() {
  // Test functions
  Expect.throws(() {
    namedArgumentsFunc1(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    namedArgumentsFunc1(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc1(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc1(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ArgumentsBindingClass1(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass1.named(forgetType(t0Instance),
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass1.positional(forgetType(t0Instance),
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test instance methods and setters
  Expect.throws(() {
    new ArgumentsBindingClass1(t1Instance).namedArgumentsMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass1(t1Instance).namedArgumentsMethod(t1Instance,
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass1(t1Instance).positionalArgumentsMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass1(t1Instance).positionalArgumentsMethod(t1Instance,
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass1(t1Instance).testSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);

  // Test static methods
  Expect.throws(() {
    ArgumentsBindingClass1.namedArgumentsStaticMethod(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    ArgumentsBindingClass1.namedArgumentsStaticMethod(t1Instance,
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    ArgumentsBindingClass1.positionalArgumentsStaticMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    ArgumentsBindingClass1.positionalArgumentsStaticMethod(t1Instance,
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test generic functions
  Expect.throws(() {
    namedArgumentsFunc2<T1>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    namedArgumentsFunc2<T1>(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc2<T1>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc2<T1>(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ArgumentsBindingClass2<T1>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass2<T1>.named(forgetType(t0Instance),
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass2<T1>.positional(forgetType(t0Instance),
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test instance methods and setters
  Expect.throws(() {
    new ArgumentsBindingClass2<T1>(t1Instance).namedArgumentsMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass2<T1>(t1Instance).namedArgumentsMethod(t1Instance,
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass2<T1>(t1Instance).positionalArgumentsMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass2<T1>(t1Instance).positionalArgumentsMethod(t1Instance,
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass2<T1>(t1Instance).testSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);

}

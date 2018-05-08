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

class ArgumentsBindingClass1 {
  ArgumentsBindingClass1(T1 t1) {}

  ArgumentsBindingClass1.named(T1 t1, {T1 t2}) {}
  ArgumentsBindingClass1.positional(T1 t1, [T1 t2]) {}

  factory ArgumentsBindingClass1.fNamed(T1 t1, {T1 t2}) {
    return new ArgumentsBindingClass1.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass1.fPositional(T1 t1, [T1 t2]) {
    return new ArgumentsBindingClass1.positional(t1, t2);
  }

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

  factory ArgumentsBindingClass2.fNamed(X t1, {X t2}) {
    return new ArgumentsBindingClass2.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass2.fPositional(X t1, [X t2]) {
    return new ArgumentsBindingClass2.positional(t1, t2);
  }

  namedArgumentsMethod(X t1, {X t2}) {}
  positionalArgumentsMethod(X t1, [X t2]){}

  set testSetter(X val) {}
}

testArgumentBinding() {
  // test functions
  namedArgumentsFunc1(forgetType(t0Instance), t2: forgetType(t0Instance));
  positionalArgumentsFunc1(forgetType(t0Instance), forgetType(t0Instance));

  // test generic functions
  namedArgumentsFunc2<T1>(forgetType(t0Instance), t2: forgetType(t0Instance));
  positionalArgumentsFunc2<T1>(forgetType(t0Instance), forgetType(t0Instance));

  // test class constructors
  ArgumentsBindingClass1 instance1 =
      new ArgumentsBindingClass1(forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass1.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass1.fPositional(forgetType(t0Instance),
      forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass1.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass1.positional(forgetType(t0Instance),
      forgetType(t0Instance));

  // tests methods and setters
  instance1.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance1.positionalArgumentsMethod(forgetType(t0Instance),
      forgetType(t0Instance));
  instance1.testSetter = forgetType(t0Instance);

  // test static methods
  ArgumentsBindingClass1.namedArgumentsStaticMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  ArgumentsBindingClass1.positionalArgumentsStaticMethod(
      forgetType(t0Instance), forgetType(t0Instance));

  // test generic class constructors
  ArgumentsBindingClass2<T1> instance2 =
      new ArgumentsBindingClass2(forgetType(t0Instance));
  instance2 = new ArgumentsBindingClass2.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingClass2.fPositional(forgetType(t0Instance),
      forgetType(t0Instance));
  instance2 = new ArgumentsBindingClass2.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingClass2.positional(forgetType(t0Instance),
      forgetType(t0Instance));

  // test generic class methods and setters
  instance2.namedArgumentsMethod(
      forgetType(t0Instance), t2: forgetType(t0Instance));
  instance2.positionalArgumentsMethod(
      forgetType(t0Instance), forgetType(t0Instance));
  instance1.testSetter = forgetType(t0Instance);
}

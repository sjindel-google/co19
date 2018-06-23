/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left FutureOr: T0 is FutureOr<S0>
 *   and Future<S0> <: T1
 *   and S0 <: T1
 * @description Check that if a type T0 is FutureOr<S0> and Future<S0> and S0
 * are subtypes of a type T1, then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../utils/common.dart";

class C1 {}
class S0 implements Future<C1> {
  asStream() => null;
  catchError(Function onError, {bool test(Object error)}) => null;
  then<S0>(FutureOr<S0> onValue(C1 value), {Function onError}) => null;
  timeout(Duration timeLimit, {FutureOr<C1> onTimeout()}) => null;
  whenComplete(FutureOr action()) => null;
}

FutureOr<S0> t0Instance = new S0();
Future<C1> t1Instance = new Future.value(new C1());




namedArgumentsFunc1(Future<C1> t1, {Future<C1> t2}) {}
positionalArgumentsFunc1(Future<C1> t1, [Future<C1> t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(Future<C1> t1) {}

  ArgumentsBindingClass.named(Future<C1> t1, {Future<C1> t2}) {}
  ArgumentsBindingClass.positional(Future<C1> t1, [Future<C1> t2]) {}

  factory ArgumentsBindingClass.fNamed(Future<C1> t1, {Future<C1> t2}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(Future<C1> t1, [Future<C1> t2]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(Future<C1> t1, {Future<C1> t2}) {}
  static positionalArgumentsStaticMethod(Future<C1> t1, [Future<C1> t2]) {}

  namedArgumentsMethod(Future<C1> t1, {Future<C1> t2}) {}
  positionalArgumentsMethod(Future<C1> t1, [Future<C1> t2]) {}

  set testSetter(Future<C1> val) {}
}

class ArgumentsBindingGen<X>  {
  ArgumentsBindingGen(X t1) {}

  ArgumentsBindingGen.named(X t1, {X t2}) {}
  ArgumentsBindingGen.positional(X t1, [X t2]) {}

  factory ArgumentsBindingGen.fNamed(X t1, {X t2}) {
    return new ArgumentsBindingGen.named(t1, t2: t2);
  }
  factory ArgumentsBindingGen.fPositional(X t1, [X t2]) {
    return new ArgumentsBindingGen.positional(t1, t2);
  }

  namedArgumentsMethod(X t1, {X t2}) {}
  positionalArgumentsMethod(X t1, [X t2]){}

  set testSetter(X val) {}
}

main() {
  // test functions
  namedArgumentsFunc1(forgetType(t0Instance), t2: forgetType(t0Instance));
  positionalArgumentsFunc1(forgetType(t0Instance), forgetType(t0Instance));

  // test generic functions
  namedArgumentsFunc2<Future<C1>>(forgetType(t0Instance), t2: forgetType(t0Instance));
  positionalArgumentsFunc2<Future<C1>>(forgetType(t0Instance), forgetType(t0Instance));

  // test class constructors
  ArgumentsBindingClass instance1 =
      new ArgumentsBindingClass(forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass.fPositional(forgetType(t0Instance),
      forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass.positional(forgetType(t0Instance),
      forgetType(t0Instance));

  // tests methods and setters
  instance1.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance1.positionalArgumentsMethod(forgetType(t0Instance),
      forgetType(t0Instance));
  instance1.testSetter = forgetType(t0Instance);

  // test static methods
  ArgumentsBindingClass.namedArgumentsStaticMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  ArgumentsBindingClass.positionalArgumentsStaticMethod(
      forgetType(t0Instance), forgetType(t0Instance));

  // test generic class constructors
  ArgumentsBindingGen<Future<C1>> instance2 =
      new ArgumentsBindingGen(forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen.fPositional(forgetType(t0Instance),
      forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen.positional(forgetType(t0Instance),
      forgetType(t0Instance));

  // test generic class methods and setters
  instance2.namedArgumentsMethod(
      forgetType(t0Instance), t2: forgetType(t0Instance));
  instance2.positionalArgumentsMethod(
      forgetType(t0Instance), forgetType(t0Instance));
  instance1.testSetter = forgetType(t0Instance);
}

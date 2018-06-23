/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right FutureOr: T1 is FutureOr<S1> and
 *   either T0 <: Future<S1>
 *   or T0 <: S1
 *   or T0 is X0 and X0 has bound S0 and S0 <: T1
 *   or T0 is X0 & S0 and S0 <: T1
 * @description Check that if a type T1 is Future<S1> and a type T0 is X0 and X0
 * has bound S0 and S0 <: Future<S1>, then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../utils/common.dart";

class S1 {}
class S0 implements Future<S1> {
  asStream() => null;
  catchError(Function onError, {bool test(Object error)}) => null;
  then<T0>(FutureOr<T0> onValue(S1 value), {Function onError}) => null;
  timeout(Duration timeLimit, {FutureOr<S1> onTimeout()}) => null;
  whenComplete(FutureOr action()) => null;
}
class X0 extends S0 {
}

X0 t0Instance = new X0();
Future<S1> t1Instance = new Future.value(new S1());




namedArgumentsFunc1(Future<S1> t1, {Future<S1> t2}) {}
positionalArgumentsFunc1(Future<S1> t1, [Future<S1> t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(Future<S1> t1) {}

  ArgumentsBindingClass.named(Future<S1> t1, {Future<S1> t2}) {}
  ArgumentsBindingClass.positional(Future<S1> t1, [Future<S1> t2]) {}

  factory ArgumentsBindingClass.fNamed(Future<S1> t1, {Future<S1> t2}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(Future<S1> t1, [Future<S1> t2]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(Future<S1> t1, {Future<S1> t2}) {}
  static positionalArgumentsStaticMethod(Future<S1> t1, [Future<S1> t2]) {}

  namedArgumentsMethod(Future<S1> t1, {Future<S1> t2}) {}
  positionalArgumentsMethod(Future<S1> t1, [Future<S1> t2]) {}

  set testSetter(Future<S1> val) {}
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
  namedArgumentsFunc2<Future<S1>>(forgetType(t0Instance), t2: forgetType(t0Instance));
  positionalArgumentsFunc2<Future<S1>>(forgetType(t0Instance), forgetType(t0Instance));

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
  ArgumentsBindingGen<Future<S1>> instance2 =
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

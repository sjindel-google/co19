/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object, dynamic, or void)
 * @description Check that if type T1 is a void and T0 is a dynamic then
 * instance of T0 can be used as T1 variable.
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

void getVoid() {}

dynamic t0Instance = "";
var t1Instance = getVoid();




namedArgumentsFunc1(void t1, {void t2}) {}
positionalArgumentsFunc1(void t1, [void t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(void t1) {}

  ArgumentsBindingClass.named(void t1, {void t2}) {}
  ArgumentsBindingClass.positional(void t1, [void t2]) {}

  factory ArgumentsBindingClass.fNamed(void t1, {void t2}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(void t1, [void t2]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(void t1, {void t2}) {}
  static positionalArgumentsStaticMethod(void t1, [void t2]) {}

  namedArgumentsMethod(void t1, {void t2}) {}
  positionalArgumentsMethod(void t1, [void t2]) {}

  set testSetter(void val) {}
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
  namedArgumentsFunc2<void>(forgetType(t0Instance), t2: forgetType(t0Instance));
  positionalArgumentsFunc2<void>(forgetType(t0Instance), forgetType(t0Instance));

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
  ArgumentsBindingGen<void> instance2 =
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

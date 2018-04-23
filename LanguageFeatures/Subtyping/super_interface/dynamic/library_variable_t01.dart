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
 * the T1 variable. Test that instance of T0 can assigned to a library variable
 * of type T1.
 * @author sgrekhov@unipro.ru
 */
import "library_variable_lib.dart";

dynamic forgetType(dynamic d) => d;

T1 foo(T1 t1) => forgetType(t1);

test() {
  T0 t0 = new T();
  libraryVariableT1 = forgetType(new T());
  libraryVariableT1 = forgetType(t0);
  libraryVariableT1 = foo(t0);
  libraryVariableT1 = foo(new T());
}

class C {
  static staticTest() {
    T0 t0 = new T();
    libraryVariableT1 = forgetType(new T());
    libraryVariableT1 = forgetType(t0);
    libraryVariableT1 = foo(t0);
    libraryVariableT1 = foo(new T());
  }

  test() {
    T0 t0 = new T();
    libraryVariableT1 = forgetType(new T());
    libraryVariableT1 = forgetType(t0);
    libraryVariableT1 = foo(t0);
    libraryVariableT1 = foo(new T());
  }
}

main() {
  T0 t0 = new T();
  libraryVariableT1 = forgetType(new T());
  libraryVariableT1 = forgetType(t0);
  libraryVariableT1 = foo(t0);
  libraryVariableT1 = foo(new T());

  bar() {
    T0 t0 = new T();
    libraryVariableT1 = forgetType(new T());
    libraryVariableT1 = forgetType(t0);
    libraryVariableT1 = foo(t0);
    libraryVariableT1 = foo(new T());
  }

  test();
  new C().test();
  C.staticTest();
  bar();
}

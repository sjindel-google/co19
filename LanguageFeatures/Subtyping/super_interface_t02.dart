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
 * the T1 variable. Test that instance of T0 can be be used as a return value of
 * type T1. Test the case when S1 extends T1
 * @author sgrekhov@unipro.ru
 */
library co19_subtype_tests;
import "common.dart";
part "tests/return_value_t01.dart";
part "tests/arguments_binding_t01.dart";
part "tests/class_member_t01.dart";

class T1 {}

abstract class S0 {}
abstract class S1 extends T1 {}
abstract class S2 {}

abstract class T0 implements S0, S1, S2  {}

class T implements T0 {}

T0 t0Instance = new T();
T1 t1Instance = new T1();

main() {
  testArgumentBinding();
  testClassMember();
  testReturnValue();
}

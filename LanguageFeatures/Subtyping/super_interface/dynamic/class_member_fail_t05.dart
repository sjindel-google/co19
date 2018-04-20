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
 * the T1 variable. Test that instance of T1 cannot assigned to a class member
 * of type T0 and TypeError is thrown
 * @author sgrekhov@unipro.ru
 */
import "../../../../Utils/expect.dart";

class T1 {}

abstract class S0 extends T1 {}
abstract class S1 {}
abstract class S2 {}

abstract class T0 implements S0, S1, S2  {}

class T implements T0 {}

dynamic forgetType(dynamic d) => d;

class C1 {
  T0 m;
}

class C2<X> {
  X m;
}

main() {
  Expect.throws(() {
    new C1().m = forgetType(new T1());
  }, (e) => e is TypeError);

  Expect.throws(() {
    new C2<T0>().m = forgetType(new T1());
  }, (e) => e is TypeError);
}

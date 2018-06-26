/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object, dynamic, or void)
 * @description Check that if type T1 is a dynamic then T0 is a subtype of a
 * type T1
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

class T0 {}

T0 t0Instance = new T0();
dynamic t1Instance = 3.14;




class ClassMemberMixin1_t03 {
  dynamic m;

  void set superSetter(dynamic val) {}
}

class ClassMember1_t03 extends Object with ClassMemberMixin1_t03 {
  test() {
    m = forgetType(t0Instance);
    superSetter = forgetType(t0Instance);
  }
}

class ClassMemberMixin2_t03<X> {
  X m;
  void set superSetter(dynamic val) {}
}

class ClassMember2_t03<X> extends Object with ClassMemberMixin2_t03<X> {
  test() {
    m = forgetType(t0Instance);
    superSetter = forgetType(t0Instance);
  }
}

main() {
  ClassMember1_t03 c1 = new ClassMember1_t03();
  c1.m = forgetType(t0Instance);
  c1.test();
  c1.superSetter = forgetType(t0Instance);

  // Generic function types cannot be used as a type parameter, so test
  // generics only if it is not a generic function type and in a separate
  // function to avoid compile-time error
  if (!isGenericFunctionType) {
    testGenerics();
  }
}

void testGenerics() {
  ClassMember2_t03<dynamic> c2 = new ClassMember2_t03<dynamic>();
  c2.m = forgetType(t0Instance);
  c2.test();
  c2.superSetter = forgetType(t0Instance);
}

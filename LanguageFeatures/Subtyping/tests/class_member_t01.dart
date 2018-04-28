/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the class member of type T1
 * @author sgrekhov@unipro.ru
 */
part of co19_subtype_tests;

class ClassMemberTest1 {
  T1 m;
  T1 _p;

  test() {
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  set setter(T1 val) {
    _p = val;
  }
}

class ClassMemberTest2<X> {
  X m;
  X _p;

  test(X v) {
    m = v;
    _p = v;
  }

  set setter(X val) {
    _p = val;
  }
}

testClassMember() {
  ClassMemberTest1 c1 = new ClassMemberTest1();
  c1.m = forgetType(t0Instance);
  c1.test();
  c1.setter = t0Instance;

  ClassMemberTest2<T1> c2 = new ClassMemberTest2<T1>();
  c2.m = forgetType(t0Instance);
  c2.test(t0Instance);
}

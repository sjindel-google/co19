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
  static T1 s = forgetType(t0Instance);
  T1 m = forgetType(t0Instance);
  T1 _p = forgetType(t0Instance);

  ClassMemberTest1() {
    s = forgetType(t0Instance);
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  ClassMemberTest1.named(T1 value) {
    s = value;
    m = value;
    _p = value;
  }

  ClassMemberTest1.short(this.m, this._p);

  test() {
    s = forgetType(t0Instance);
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  set setter(T1 val) {
    _p = val;
  }

  T1 get getter => forgetType(_p);

  static staticTest() {
    s = forgetType(t0Instance);
  }

  static set staticSetter(T1 val) {
    s = val;
  }

  static T1 get staticGetter => forgetType(t0Instance);
}

class ClassMemberTest2<X> {
  X m;
  X _p;

  ClassMemberTest2() {
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  ClassMemberTest2.named(X value) {
    m = value;
    _p = value;
  }

  ClassMemberTest2.short(this.m, this._p);

  test(X v) {
    m = v;
    _p = v;
  }

  set setter(X val) {
    _p = val;
  }

  T1 get getter => forgetType(_p);
}

testClassMember() {
  ClassMemberTest1 c1 = new ClassMemberTest1();
  c1 = new ClassMemberTest1.short(forgetType(t0Instance),
      forgetType(t0Instance));
  c1 = new ClassMemberTest1.named(forgetType(t0Instance));
  c1.m = forgetType(t0Instance);
  c1.test();
  c1.setter = forgetType(t0Instance);
  c1.getter;

  ClassMemberTest1.s = forgetType(t0Instance);
  ClassMemberTest1.staticTest();
  ClassMemberTest1.staticSetter = forgetType(t0Instance);
  ClassMemberTest1.staticGetter;

  ClassMemberTest2<T1> c2 = new ClassMemberTest2<T1>();
  c2 = new ClassMemberTest2<T1>.short(forgetType(t0Instance),
      forgetType(t0Instance));
  c2 = new ClassMemberTest2<T1>.named(forgetType(t0Instance));
  c2.m = forgetType(t0Instance);
  c2.test(t0Instance);
  c2.getter;
}

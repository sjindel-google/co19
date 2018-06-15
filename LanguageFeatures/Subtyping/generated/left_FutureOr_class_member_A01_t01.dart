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
  // factory S0(FutureOr<C1> computation()) =>  computation();
  asStream() => null;//new Stream.fromFuture(new Completer().future);
  catchError(Function onError, { bool test(Object error) }) => null;//onError();
  then<S0>(FutureOr<S0> onValue(C1 value), { Function onError }) => null;
  //    onValue(new C1());
  timeout(Duration timeLimit, { FutureOr<C1> onTimeout() }) => null;//onTimeout();
  whenComplete(FutureOr action()) => null;//action();
}

//FutureOr computation() async => new C1();
//FutureOr com() async => new S0();
FutureOr<S0> t0Instance = new S0();
Future<C1> t1Instance = new Future.value(new C1());





class ClassMember1_t01 {
  static Future<C1> s = forgetType(t0Instance);
  Future<C1> m = forgetType(t0Instance);
  Future<C1> _p = forgetType(t0Instance);

  ClassMember1_t01() {
    s = forgetType(t0Instance);
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  ClassMember1_t01.named(Future<C1> value) {
    s = value;
    m = value;
    _p = value;
  }

  ClassMember1_t01.short(this.m, this._p);

  test() {
    s = forgetType(t0Instance);
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  set setter(Future<C1> val) {
    _p = val;
  }

  Future<C1> get getter => forgetType(_p);

  static staticTest() {
    s = forgetType(t0Instance);
  }

  static set staticSetter(Future<C1> val) {
    s = val;
  }

  static Future<C1> get staticGetter => forgetType(t0Instance);
}

class ClassMember2_t01<X> {
  X m;
  X _p;

  ClassMember2_t01() {
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  ClassMember2_t01.named(X value) {
    m = value;
    _p = value;
  }

  ClassMember2_t01.short(this.m, this._p);

  test(X v) {
    m = v;
    _p = v;
  }

  set setter(X val) {
    _p = val;
  }

  Future<C1> get getter => forgetType(_p);
}

main() {
  ClassMember1_t01 c1 = new ClassMember1_t01();
  c1 = new ClassMember1_t01.short(forgetType(t0Instance),
      forgetType(t0Instance));
  c1 = new ClassMember1_t01.named(forgetType(t0Instance));
  c1.m = forgetType(t0Instance);
  c1.test();
  c1.setter = forgetType(t0Instance);
  c1.getter;

  ClassMember1_t01.s = forgetType(t0Instance);
  ClassMember1_t01.staticTest();
  ClassMember1_t01.staticSetter = forgetType(t0Instance);
  ClassMember1_t01.staticGetter;

  ClassMember2_t01<Future<C1>> c2 = new ClassMember2_t01<Future<C1>>();
  c2 = new ClassMember2_t01<Future<C1>>.short(forgetType(t0Instance),
      forgetType(t0Instance));
  c2 = new ClassMember2_t01<Future<C1>>.named(forgetType(t0Instance));
  c2.m = forgetType(t0Instance);
  c2.test(forgetType(t0Instance));
  c2.getter;
}

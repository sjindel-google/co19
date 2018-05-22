/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object, dynamic, or void)
 * @description Check that if type T1 is a void then instance of
 * T0 can be used as T1 variable.
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

class T0 {}

void getVoid() {}

T0 t0Instance = new T0();
var t1Instance = getVoid();




class ArgumentsBindingSuper1_t02 {
  void m;

  ArgumentsBindingSuper1_t02(void value) {}
  ArgumentsBindingSuper1_t02.named(void value, {void val2}) {}
  ArgumentsBindingSuper1_t02.positional(void value, [void val2]) {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(void val) {}
  void superTestPositioned(void val, [void val2]) {}
  void superTestNamed(void val, {void val2}) {}
  void get superGetter => m;
  void set superSetter(void val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding1_t02.c1(dynamic t1) : super.named(t1) {}
  ArgumentsBinding1_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding1_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding1_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding1_t02.c5(dynamic t1) : super.short(t1) {}

  test(dynamic t1, dynamic t2) {
    superTest(t1);
    superTestPositioned(t1);
    superTestPositioned(t2, t1);
    superTestNamed(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

class ArgumentsBindingSuper2_t02<X> {
  X m;

  ArgumentsBindingSuper2_t02(X value) {}
  ArgumentsBindingSuper2_t02.named(X value, {X val2}) {}
  ArgumentsBindingSuper2_t02.positional(X value, [X val2]) {}
  ArgumentsBindingSuper2_t02.short(this.m);

  void superTest(X val) {}
  void superTestPositioned(X val, [X val2]) {}
  void superTestNamed(X val, {X val2}) {}
  X get superGetter => m;
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t02<X> extends ArgumentsBindingSuper2_t02<X> {
  ArgumentsBinding2_t02(X t1) : super(t1) {}
  ArgumentsBinding2_t02.c1(dynamic t1) : super.named(t1) {}
  ArgumentsBinding2_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding2_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding2_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding2_t02.c5(dynamic t1) : super.short(t1) {}

  test(X t1, X t2) {
    superTest(t1);
    superTestPositioned(t1);
    superTestPositioned(t2, t1);
    superTestNamed(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

main() {
  ArgumentsBinding1_t02 c1 = new ArgumentsBinding1_t02(forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c1(forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c2(t1Instance, forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c3(forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c4(t1Instance, forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c5(forgetType(t0Instance));

  c1.test(forgetType(t0Instance), t1Instance);
  c1.superTest(forgetType(t0Instance));
  c1.superTestPositioned(forgetType(t0Instance));
  c1.superTestPositioned(t1Instance, forgetType(t0Instance));
  c1.superTestNamed(forgetType(t0Instance));
  c1.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c1.superSetter = forgetType(t0Instance);
  c1.superGetter;

  ArgumentsBinding2_t02<void> c2 =
      new ArgumentsBinding2_t02<void>(forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<void>.c1(forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<void>.c2(t1Instance, forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<void>.c3(forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<void>.c4(t1Instance, forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<void>.c5(forgetType(t0Instance));

  c2.test(forgetType(t0Instance), t1Instance);
  c2.superTest(forgetType(t0Instance));
  c2.superTestPositioned(forgetType(t0Instance));
  c2.superTestPositioned(t1Instance, forgetType(t0Instance));
  c2.superTestNamed(forgetType(t0Instance));
  c2.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c2.superSetter = forgetType(t0Instance);
  c2.superGetter;
}

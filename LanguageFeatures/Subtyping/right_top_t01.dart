/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object, dynamic, or void).
 * @description Check that a type T0 is a subtype of a type T1, if T1 is Object.
 * @author ngl@unipro.ru
 */

class A {
}
class B extends A {
}

main() {
  List<num> list1 = new List<Object>();
  List<Object> list2 = new List<num>();
  List<B> list3 = new List<Object>();
  List<Object> list4 = new List<B>();
  List<A> list5 = new List<Object>();
  List<Object> list6 = new List<A>();
  List<Null> list7 = new List<Object>();
  List<Object> list8 = new List<Null>();
  List<dynamic> list9 = new List<Object>();
  List<Object> list10 = new List<dynamic>();
  List<void> list11 = new List<Object>();
  List<Object> list12 = new List<void>();
}

/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Bottom: T0 is Null
 * @description Check that a type T0 is a subtype of a type T1, if T0 is Null.
 * @author ngl@unipro.ru
 */

class A {
}
class B extends A {
}

main() {
  List<Null> list1 = new List<num>();
  List<num> list2 = new List<Null>();
  List<Null> list3 = new List<B>();
  List<B> list4 = new List<Null>();
  List<Null> list5 = new List<A>();
  List<A> list6 = new List<Null>();
  List<Null> list7 = new List<Object>();
  List<Object> list8 = new List<Null>();
  List<Null> list9 = new List<dynamic>();
  List<dynamic> list10 = new List<Null>();
  List<Null> list11 = new List<void>();
  List<void> list12 = new List<Null>();
}

/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the superclass member of type T1.
 * Assignment to instance variable of generic super class is tested.
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ClassMemberSuper2_t02<X> {
  X m;

  ClassMemberSuper2_t02() {}

  void set superSetter(X val) {}
}

class ClassMember2_t02<X> extends ClassMemberSuper2_t02<X> {
  ClassMember2_t02() : super() {}

  ClassMember2_t02.valid() : super();
}

main() {
  new ClassMember2_t02<@T1>.valid().superSetter = t0Instance;
}

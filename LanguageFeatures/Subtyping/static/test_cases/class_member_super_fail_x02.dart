/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the superclass member of type T1.
 * Assignment to instance variable in constructor is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ClassMemberSuper1_t02 {
  @T1 m;

  ClassMemberSuper1_t02.named(@T0 value) {
    m = value;
  }
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {
  ClassMember1_t02.named() : super.named(t0Instance) {}
}

main() {
  new ClassMember1_t02.named();
}

/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the mixin member of type T1.
 * Assignment to instance variable of super class in instance method is tested.
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ClassMemberSuper1_t03 {
  @T1 m;
}

class ClassMember1_t03 extends Object with ClassMemberSuper1_t03 {

  test1() {
    m = t0Instance;
  }
}

main() {
  new ClassMember1_t03().test1();
}

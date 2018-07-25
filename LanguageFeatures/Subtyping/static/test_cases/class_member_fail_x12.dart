/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as a class member of type T1. Assignment to private class variable in
 * method is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ClassMemberTestPrivate {
  @T1 _m;

  ClassMemberTestPrivate.validConstructor() {}

  test(@T0 val) {
    _m = val;
  }
}

main() {
  new ClassMemberTestPrivate.validConstructor().test(t0Instance);
}

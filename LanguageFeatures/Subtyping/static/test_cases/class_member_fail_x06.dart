/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as a class member of type T1. Assignment to static class variable is
 * tested.
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ClassMemberTestPublic {
  @T1 m;

  ClassMemberTestPublic.validConstructor() {}
}

main() {
    new ClassMemberTestPublic.validConstructor().m = t0Instance;
}

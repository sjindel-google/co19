/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as a class member of type T1. Returning static class variable in
 * static getter is tested.
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ClassMemberTestPublic {
  @T1 m;

  ClassMemberTestPublic.validConstructor() {}

  @T1 get getter => t0Instance;
}

main() {
    new ClassMemberTestPublic.validConstructor().getter;
}

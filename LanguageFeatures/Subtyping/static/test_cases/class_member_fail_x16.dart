/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as a class member of type T1. Setting instance class variable of
 * generic class is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ClassMemberTestGenericPublic<X> {
  X m;

  ClassMemberTestGenericPublic.validConstructor() {}
}

main() {
  new ClassMemberTestGenericPublic<@T1>.validConstructor().m = t0Instance;
}

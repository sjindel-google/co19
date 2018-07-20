/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test mixin members. Super getter return
 * type is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ArgumentsBindingSuper1_t03 {
  @T1 get superGetter => t0Instance;
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingSuper1_t03 {
}

main() {
  new ArgumentsBinding1_t03().superGetter;
}

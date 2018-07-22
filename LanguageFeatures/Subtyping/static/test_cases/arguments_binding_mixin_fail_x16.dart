/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test mixin members. Super method
 * positional argument is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ArgumentsBindingSuper1_t03 {
  void superTestPositioned(@T1 val, [@T1 val2]) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingSuper1_t03 {
  test() {
    super.superTestPositioned(t1Instance, t0Instance);
  }
}

main() {
  new ArgumentsBinding1_t03().test();
}

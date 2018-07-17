/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Factory constructor positional argument is
 * tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class ArgumentsBindingClassGen<X> {
  ArgumentsBindingClassGen(X t1) {}

  ArgumentsBindingClassGen.positional(X t1, [X t2]) {}

  factory ArgumentsBindingClassGen.fPositional(X t1, [X t2]) {
    return new ArgumentsBindingClassGen.positional(t1, t2);
  }
}

main() {
  new ArgumentsBindingClassGen<@T1>.fPositional(t1Instance, t0Instance);
}

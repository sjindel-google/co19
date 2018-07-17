/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class ArgumentsBindingClassSuper {
  ArgumentsBindingClassSuper(@T1 t1) {}
}

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper {
  ArgumentsBindingDesc(@T0 t0) : super (t0) {}
}

main() {
  new ArgumentsBindingDesc(t0Instance);
}

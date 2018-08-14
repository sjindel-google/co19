/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that only static type of a double valued integer literal
 * is [double]
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

int foo() => 2;

main() {
  double d1 = foo();
}

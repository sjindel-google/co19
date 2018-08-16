/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test global variable assignment
 * @author sgrekhov@unipro.ru
 */
double g1 = 42;
double g2 = (3 > 2 ? 2 : 3);
const double g3 = -42;
final double g4 = 23;

main() {
  g1 = -42;
  g2 = 42;

  g1 = null;
  g1 ??= 42;
  g1 ??= -42;
}

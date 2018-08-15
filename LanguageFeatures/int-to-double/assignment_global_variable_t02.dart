/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test global variable assignment and hexadecimal values
 * @author sgrekhov@unipro.ru
 */
double g1 = 0x42;
double g2 = (3 > 2 ? 0x2 : 0x3);
const double g3 = -0x42;
final double g4 = 0x23;

main() {
  g1 = -0x42;
  g2 = 0x42;
}

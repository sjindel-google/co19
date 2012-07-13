/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Fails gracefully if supplied with an argument of a wrong type.
 * @description Tries to pass various wrong parameters to the method.
 * @static-warning
 * @author iefremov
 */

main() {
  Expect.throws(() => new Queue().addAll(1));
  Expect.throws(() => new Queue().addAll(1.1));
  Expect.throws(() => new Queue().addAll(""));
}
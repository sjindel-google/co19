/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * ...
 * The returned iterable provides elements by iterating this iterable, but
 * skipping over all initial elements where test(element) returns true. If all
 * elements satisfy test the resulting iterable is empty, otherwise it iterates
 * the remaining elements in their original order, starting with the first
 * element for which test(element) returns false.
 * @description Checks that once an element does not satisfy the [test] every
 * later element is iterated unconditionally.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var list = new Uint64List.fromList([1, 1, 2, 1, 1, 1]);
  var res = list.skipWhile((e) => e == 1);
  Expect.equals(4, res.length);
  Expect.equals(2, res.elementAt(0));
  for (int i = 1; i < 4; ++i) {
    Expect.equals(1, res.elementAt(i));
  }
}

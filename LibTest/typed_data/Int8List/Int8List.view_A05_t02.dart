/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int8List.view(ByteBuffer buffer, [int byteOffset = 0, int length])
 * ...
 * Throws [RangeError] if [offsetInBytes] or [length] are negative, or
 * if [offsetInBytes] + ([length] * elementSizeInBytes) is greater than
 * the length of [buffer].
 * @description Checks that [RangeError] is thrown if [length] is negative.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array, int offset, int length) {
  var tmp = new Int8List.fromList(array);
  var byteBuffer = tmp.buffer;
  try {
    new Int8List.view(byteBuffer, offset, length);
    Expect.fail("RangeError exception is expected");
  } on RangeError {
  }
}

main() {
  check([0], 0, -5);
  check([100, 50], 1, -100);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 10, -1);
}

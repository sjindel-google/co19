/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> sublist(int start, [int end])
 * ...
 * An error occurs if [start] is outside the range 0 .. length or if [end] is
 * outside the range start .. length.
 * @description Checks that it is an error if [start] or [end] are not indices
 * into [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

check(List<Float32x4> list, dynamic start, dynamic end) {
  var l = new Float32x4List.fromList(list);

  Expect.throws( () {
    l.sublist(start, end);
  });
}

main() {
  check([], 0, 1);
  check([pack(.0), pack(.0), pack(.0)],-1, 1);
  check([pack(.0), pack(.0), pack(.0)],-1, 2);
  check([pack(.0), pack(.0), pack(.0)], 0, 4);
  check([pack(.0), pack(.0), pack(.0)], 2, 100);
  check([pack(.0), pack(.0), pack(.0)],-10, 10);
}

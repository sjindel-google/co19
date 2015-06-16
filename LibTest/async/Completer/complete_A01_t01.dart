/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void complete([T value])
 * Completes future with the supplied values.
 * If the value is itself a future, the completer will wait for that future to
 * complete, and complete with the same result, whether it is a success or an
 * error.
 * All listeners on the future are informed about the value.
 * @description Checks that after [complete] is called, a value in corresponding
 * future is available.
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

check(value) {
  var completer = new Completer();
  var future = completer.future;

  completer.complete(value);
  
  asyncStart();
  future.then((fValue) {
    Expect.equals(fValue, value);
    asyncEnd();
  });
}

main() {
  check(0);
  check(-5);
  check(null);
  check('string');
  check(true);
  check(const {'k1': 1, 'k2': 2});
}
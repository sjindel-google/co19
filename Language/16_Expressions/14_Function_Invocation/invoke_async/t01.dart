/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that if function f is marked async, then an instance of class Future
 * is returned to the caller. Checks that the body of f is not executed immediately.
 * @author kaigorodov
 */
import "dart:async";
import "package:expect/expect.dart";

bool executed=false;

f (int value) async {
  executed=true;
  return value;
}

main() {
  Object res = f(12);
  Expect.isTrue(res is Future, "actual: ${res.runtimeType}");
  Expect.isFalse(executed);
}

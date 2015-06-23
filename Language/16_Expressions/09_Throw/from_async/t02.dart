/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that if function f is asynchronous generator, and there is a
 * dynamically enclosing exception handler h introduced by the current activation,
 * control is transferred to h.
 * @author kaigorodov
 */
import "dart:async";
import "package:expect/expect.dart";
import "package:async_helper/async_helper.dart";

f (int value) async* {
  try {
    throw value;
  } catch (e) {
    yield e+1;
  }
}

test() async {
  const int value=12345;
  Stream<int> res= f(value);
  await res.listen((e)=>Expect.equals(value+1, e),
    onError: (e)=>Expect.fail(e)
  ).asFuture;
}

main() {
  asyncStart();
  test().then((_) => asyncEnd());
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that if function f is marked async, then The body of f
 * is scheduled for execution at some future time. Checks that he value used
 * to complete the future o is the current return value, if it is defined.
 * @author kaigorodov
 */
import "dart:async";
import "package:expect/expect.dart";
import "package:async_helper/async_helper.dart";

f (int value) async {
  return value;
}

test() async {
  const int value=12345;
  Future<int> res= f(value);
  await res.then((e)=>Expect.equals(value, e),
    onError: (e)=>Expect.fail(e)
  );
}

main() {
  asyncStart();
  test().then((_) => asyncEnd());
}

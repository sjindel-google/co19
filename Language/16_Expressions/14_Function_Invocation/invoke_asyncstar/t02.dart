/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that if function f is marked async*, then
 * execution of the body of f will begin when the stream is listened to.
 * @author kaigorodov
 */
import "dart:async";
import "package:expect/expect.dart";
import "package:async_helper/async_helper.dart";

bool executed=false;

f (int value) async* {
  executed=true;
  yield value;
}

test() async {
  Stream<int> res= f(123);
  await res.listen((_){ Expect.isTrue(executed);}
  ).asFuture;
}

main() {
  asyncStart();
  test().then((_) => asyncEnd());
}

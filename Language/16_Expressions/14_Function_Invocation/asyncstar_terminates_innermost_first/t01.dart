/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that when asynchronous function f terminates, any open
 * stream subscriptions associated with any asynchronous for loops or yield-each
 * statements executing within f are canceled, in the order of their nesting,
 * innermost first.
 * @author kaigorodov
 */
import "dart:async";
import "package:expect/expect.dart";
import "package:async_helper/async_helper.dart";

f (int value) async* {
  for (int k=0; k<10; k++) { 
     yield value;
  }
}

test() async {
  Stream<int> res= f(123);
  StreamSubscription<int> subscr=res.listen(null);
  Future fut=subscr.cancel();
  Expect.isNotNull(fut);
  return fut.then((v) => Expect.isNull(v));
}

main() {
  asyncStart();
  test().then((_) => asyncEnd());
}

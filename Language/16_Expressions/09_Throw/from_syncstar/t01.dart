/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that if function f is marked sync* then a dynamically enclosing
 * exception handler encloses the call to moveNext() that initiated the
 * evaluation of the throw expression.
 * @author kaigorodov
 */
import "package:expect/expect.dart";

Iterable<int> f() sync* {
  for (int i=0; i<5; i++) {
    if (i==3) {
      throw i;
    }
    yield i;
  }
}

void main() {
  Iterator<int> it=f().iterator;
  for (int k=0; k<10; k++) {
    try {
      if (!it.moveNext()) {
        break;
      }
      Expect.equals(k, it.current);
    } catch (e) {
      Expect.equals(k, e);
    }
  }
}


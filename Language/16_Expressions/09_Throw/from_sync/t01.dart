/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that if f is synchronous, control is transferred to
 * the nearest dynamically enclosing exception handler
 * @author kaigorodov
 */

import "package:expect/expect.dart";

int f (int value) {
  throw value;
}

int f1(int value) {
  return f(value);
}

int f2(int value) {
  return f1(value);
}

main() {
  const int value=12345;
  int res=-value;
  try {
    res=f(value);
  } catch(e) {
    Expect.equals(-value, res);
    Expect.equals(value, e);
  }
  try {
    res=f2(value);
  } catch(e) {
    Expect.equals(-value, res);
    Expect.equals(value, e);
  }
}

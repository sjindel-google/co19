/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws NullPointerException if [charCodes] is null.
 * @description Checks that a NullPointerException is thrown when the argument is null.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */


main() {
  try {
    String str = new String.fromCharCodes(null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}

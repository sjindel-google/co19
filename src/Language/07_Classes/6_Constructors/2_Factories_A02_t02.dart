/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if M.id is not a constructor name.
 * It is a compile-time error if M is not the name of the immediately enclosing class.
 * @description Checks that it's both a compile-time error and a static warning 
 * when factory keyword is followed by a name that is not a constructor name.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 * @needsreview issue 7602
 */

class C {
  C();
  factory WrongClass.id() {}
}

main() {
  try {
    new C();
  } catch (anything) {
  }
}
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unqualified function invocation i has the form id(a1, ... , an, xn+1 : an+1, ... , xn+k :
 * an+k), where id is an identifier.
 * If there exists a lexically visible declaration named id, let fid be the inner-
 * most such declaration. Then:
 *  - If fid is a local function, a library function, a library or static getter or a
 * variable then i is interpreted as a function expression invocation.
 *  - Otherwise, if fid is a static method of the enclosing class C, i is equivalent to
 * the static method invocation C.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
 *  - Otherwise, if i occurs inside a top level or static function (be it function,
 * method, getter, or setter) or variable initializer, evaluation of i causes a
 * NoSuchMethodError to be thrown.
 * Otherwise, i is equivalent to the ordinary method invocation this.id(a1, ... , an, xn+1 :
 * an+1, ... , xn+k : an+k).
 * @description Checks that if fid is a static getter, it is evaluated as
 * a function expression invocation.
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class A {
  static get m {
    return (p1, p2) {
      Expect.equals(1, p1);
      Expect.equals(2, p2);
      return "";
    };
  }
  
  static get n {
    return "";
  }


  test() {
    Expect.equals("", m(1, 2));

    try {
      n("a", 1);
      Expect.fail("NoSuchMethodError expected");
    } on NoSuchMethodError catch(ok) {}
  }
}

main() {
  new A().test();
}
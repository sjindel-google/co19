/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a mixin declaration like mixin A<X extends S, Y extends T>
 * on B, C implements D, E { body } the on clause declares the interfaces B and
 * C as super-class constraints of the mixin. Having a super-class constraint
 * allows the mixin declaration instance members to perform super-invocations
 * (like super.foo()) if they are allowed by a class implementing both B and C.
 *
 * @description Checks that a mixin declaration can perform super-invocations.
 * Test methods
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class B {
  String b1() => "B.b1";
  String b2() {
    return "B.b2";
  }
  String b3(String arg) {
    return "B.b3:$arg";
  }
}
class C {
  String c1() => "C.c1";
  String c2() {
    return "C.c2";
  }
  String c3(String arg) {
    return "C.c3:$arg";
  }
}

mixin M on B, C {
  String b1() => "M.b1";
  String b2() {
    return "M.b2";
  }
  String b3(String arg) {
    return "M.b3:$arg";
  }
  String c1() => "M.c1";
  String c2() {
    return "M.c2";
  }
  String c3(String arg) {
    return "M.c3:$arg";
  }

  testM() {
    Expect.equals("B.b1", super.b1());
    Expect.equals("B.b2", super.b2());
    Expect.equals("B.b3:M", super.b3("M"));
    Expect.equals("C.c1", super.c1());
    Expect.equals("C.c2", super.c2());
    Expect.equals("C.c3:M", super.c3("M"));
  }
}

class MA with M {
  String b1() => "MA.b1";
  String b2() {
    return "MA.b2";
  }
  String b3(String arg) {
    return "MA.b3:$arg";
  }
  String c1() => "MA.c1";
  String c2() {
    return "MA.c2";
  }
  String c3(String arg) {
    return "MA.c3:$arg";
  }

  testMA() {
    Expect.equals("M.b1", super.b1());
    Expect.equals("M.b2", super.b2());
    Expect.equals("M.b3:MA", super.b3("MA"));
    Expect.equals("M.c1", super.c1());
    Expect.equals("M.c2", super.c2());
    Expect.equals("M.c3:MA", super.c3("MA"));
  }
}

main() {
  MA ma = new MA();
  Expect.equals("MA.b1", ma.b1());
  Expect.equals("MA.b2", ma.b2());
  Expect.equals("MA.b3:X", ma.b3("X"));
  Expect.equals("MA.c1", ma.c1());
  Expect.equals("MA.c2", ma.c2());
  Expect.equals("MA.c3:X", ma.c3("X"));

  ma.testM();
  ma.testMA();
}

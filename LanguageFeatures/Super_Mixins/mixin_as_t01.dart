/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A mixin declaration introduces a mixin and an interface, but not
 * a class.
 *
 * @description Checks that mixin declaration introduces an interface.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

class I {}
class J {}

class B {}
class C {}

mixin M on B, C implements I, J {
  int f() => 1;
}

class D implements M {
  int f() => 2;
}

main() {
  Expect.equals(2, new D().f());
}

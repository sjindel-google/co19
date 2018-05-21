/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if T0 and T1 are the same type then T0 is a subtype
 * of a type T1
 * @author sgrekhov@unipro.ru
 */
class A {
}

class C<T> {
}

main() {
  C c1 = new C();
  C<dynamic> c2 = new C<dynamic>();
  c1 = c2;

  C<dynamic> c3 = new C<dynamic>();
  C c4 = new C();
  c4 = c3;

  C<A> a1 = new C<A>();
  C<A> a2 = new C<A>();
  a1 = a2;
}

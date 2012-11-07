/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is a parameterized type S < U1, ... ,Um >, let R = S. It is a
 * compile-time error if S is not a generic type with m type parameters. If T is
 * not a parameterized type, let R = T. If R is an interface, let C be the factory
 * class of R. Otherwise let C = R. Furthermore, if e is of the form new
 * T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) then let q be the constructor of C
 * that corresponds to the constructor T.id, otherwise let q be the constructor
 * of C that corresponds to the constructor T. Finally, if C is generic but T is
 * not a parameterized type, then for i from 1 to m, let Vi = Dynamic, otherwise let
 * Vi = Ui.
 * Evaluation of e proceeds as follows:
 *  ...
 *  if q is a generative or redirecting constructor (7.6.1), then:
 *   Let Ti be the type parameters of R (if any) and let Bi be the bound of
 *   Ti, 1 <= i <= m. In checked mode, it is a dynamic type error if Vi is not a subtype
 *   of [V1, ..., Vm /T1, ..., Tm]Bi, i ∈ 1..m.
 * @description  Checks that it is a dynamic type error if a type argument is not
 * a subtype of its bound in class C.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

import "../../../Utils/dynamic_check.dart";

class C<T extends num> {
  C() {}
}

main() {
  checkTypeError( () {
    new C<bool>();
  });

  checkTypeError( () {
    new C<String>();
  });
}
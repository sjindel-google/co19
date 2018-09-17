/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Mixin application semantics is mostly unchanged, except that it's
 * a compile-time error to apply a mixin to a class that doesn't implement all
 * the 'on' type requirements of the mixin declaration, or apply a mixin
 * containing super-invocations to a class that doesn't have a concrete
 * implementation of the super-invoked members compatible with the
 * super-constraint interface.
 *
 * @description Checks that it is a compile error to apply a mixin to a class
 * that doesn't implement all the 'on' type requirements of the mixin
 * declaration.
 * @compile-error
 * @author ngl@unipro.ru
 */

class X {}
class Y {}

class I {}

class J {}

abstract class B<X> {
  X get gi;
  set si(X p);
  X f();
}

abstract class C<Y> {
  Y get gj;
  set sj(Y p);
  Y g();
}

mixin M<X, Y> on B, C implements I, J {}

class MA1<X, Y> with M {}   //# 01: compile-time error

class MA2<X, Y> with M {    //# 02: compile-time error
  X i = 1 as X;
  X get gi => i;
  set si(X p) => i = p;
  X f() => i;
}

class MA3<X, Y> with M {    //# 03: compile-time error
  Y j = 2 as Y;
  Y get gj => j;
  set sj(Y p) => j = p;
  Y g() => j;
}

class MA4<X, Y> with M {    //# 04: compile-time error
  X i = 1 as X;
  Y j = 2 as Y;
  set si(X p) => i = p;
  X f() => i;
  Y get gj => j;
  set sj(Y p) => j = p;
  Y g() => j;
}

class MA5<X, Y> with M {    //# 05: compile-time error
  X i = 1 as X;
  Y j = 2 as Y;
  X get gi => i;
  X f() => i;
  Y get gj => j;
  set sj(Y p) => j = p;
  Y g() => j;
}

class MA6<X, Y> with M {    //# 06: compile-time error
  X i = 1 as X;
  Y j = 2 as Y;
  X get gi => i;
  set si(X p) => i = p;
  Y get gj => j;
  set sj(Y p) => j = p;
  Y g() => j;
}

class MA7<X, Y> with M {    //# 07: compile-time error
  X i = 1 as X;
  Y j = 2 as Y;
  X get gi => i;
  set si(X p) => i = p;
  X f() => i;
  set sj(Y p) => j = p;
  Y g() => j;
}

class MA8<X, Y> with M {    //# 08: compile-time error
  X i = 1 as X;
  Y j = 2 as Y;
  X get gi => i;
  set si(X p) => i = p;
  X f() => i;
  Y get gj => j;
  Y g() => j;
}

class MA9<X, Y> with M {    //# 09: compile-time error
  X i = 1 as X;
  Y j = 2 as Y;
  X get gi => i;
  set si(X p) => i = p;
  X f() => i;
  Y get gj => j;
  set sj(Y p) => j = p;
}

main() {
}

/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
 * Named Function Types: T0 is U0 Function<X0 extends B00, ..., Xk extends B0k>
 *   (T0 x0, ..., Tn xn, {Tn+1 xn+1, ..., Tm xm})
 *
 * and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ..., Sn yn,
 * {Sn+1 yn+1, ..., Sq yq})
 * and {yn+1, ... , yq} subset of {xn+1, ... , xm}
 * and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...n
 * and Si[Z0/Y0, ..., Zk/Yk] <: Tj[Z0/X0, ..., Zk/Xk] for i in n+1...q, yj = xi
 * and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
 * and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
 * where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
 * @description Check that T0 is not a subtype of T1 if {yn+1, ... , yq} is not
 * a subset of {xn+1, ... , xm}
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
class U0<X, Y> extends U1<X, Y> {}
class U1<X, Y> {}
class B0<X, Y> {}
class B1<X, Y> {}
class V0<X, Y> {}
class V1<X, Y> {}
class V2<X, Y> {}
class V3<X, Y> {}
class V4<X, Y> {}
class S0<X, Y> extends V0<X, dynamic> {}
class S1<X, Y> extends V1<X, Y> {}
class S2<X, Y> extends V2 {}
class S3<X, Y> extends V3<X, Y> {}

class X0<X, Y> extends B0<X, dynamic> {}
class X1<X, Y> extends B1<X, Y> {}

class Y0<X, Y> extends B0<X, Y> {}
class Y1<X, Y> extends B1<X, Y> {}

typedef U0 T0<X0 extends B0,X1 extends B1>(V0 x0, V1 x1, {V2 x2, V3 x3, V4 x4});
typedef U1 T1<Y0 extends B0,Y1 extends B1>(S0 y0, S1 y1, {S2 x2, S3 y3}); // y3, while should be x3

class Z0 extends B0 {}
class Z1 extends B1 {}

class CompareTypes<X extends Y, Y> {}

main() {
  List<T1> t1 = new List<T0>();
  List<T1<Z0, Z1>> t2 = new List<T0<Z0, Z1>>();
  List<T1> t3 = new List<T0<Z0, Z1>>();

  new CompareTypes<T0, T1>();
  new CompareTypes<T0<Z0, Z1>, T1<Z0, Z1>>();
  new CompareTypes<T0, T1<Z0, Z1>>();
}

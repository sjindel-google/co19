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
 * and {yn+1, ... , yq} subsetof {xn+1, ... , xm}
 * and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...n
 * and Si[Z0/Y0, ..., Zk/Yk] <: Tj[Z0/X0, ..., Zk/Xk] for i in n+1...q, yj = xi
 * and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
 * and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
 * where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
 * @description Check that if  B0i[Z0/X0, ..., Zk/Xk] !== B1i[Z0/Y0, ..., Zk/Yk]
 * for any i in 0...k, then T0 is not a subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test superclass members. Super constructor
 * required argument is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from named_function_types_fail_A51.dart and 
 * arguments_binding_super_fail_x04.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

class U0 extends U1 {}
class U1 {}
class B0 {}
class B1 {}
class V0 {}
class V1 {}
class V2 {}
class V3 {}
class V4 {}
class S0 extends V0 {}
class S1 extends V1 {}
class S2 extends V2 {}
class S3 extends V3 {}

class X0 extends B0 {}
class X1 extends B1 {}

class Y0 extends B0 {}

typedef T0 = U0 Function<X extends B0, Y extends B1>(V0 x0, V1 x1, {V2 x2, V3 x3, V4 x4});
typedef T1 = U1 Function<X extends B0, Y extends B0>(S0 y0, S1 y1, {S2 x2, S3 x3}); //  Y extends B0, not B1

U0 t0Func<X extends B0, Y extends B1>(V0 x0, V1 x1, {V2 x2, V3 x3, V4 x4}) => null;
U1 t1Func<X extends B0, Y extends B0>(S0 y0, S1 y1, {S2 x2, S3 x3}) => null;

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;



class ArgumentsBindingSuper1_t02 {
  ArgumentsBindingSuper1_t02.positional(T1 value, [T1 val2]) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02.c3(T0 t1) : super.positional(t1) {}
}


main() {
  new ArgumentsBinding1_t02.c3(t0Instance);
}

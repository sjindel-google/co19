/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Function Type/Function: T0 is a function type and T1 is Function
 * @description Check that if type T0 is a function type and T1 is Function then
 * T0 is a subtype of T1. Test generic function without actual arguments but
 * returning some value
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

class C {}

typedef C T0<X extends C>();
C t0Func<X extends C>() => new C();

T0<C> t0Instance = t0Func;
Function t1Instance = null;

//# @T0 = T0
//# @T1 = Function

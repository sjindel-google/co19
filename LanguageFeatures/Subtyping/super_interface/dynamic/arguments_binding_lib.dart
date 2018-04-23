/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
library return_value_lib;

class T1 {}

abstract class S0 extends T1 {}
abstract class S1 {}
abstract class S2 {}

abstract class T0 implements S0, S1, S2 {}

class T2 implements S1, S2 {}

class T implements T0 {}

T1 namedArgumentsFunc1(T1 t1, T1 t2, {T1 t3, T1 t4}) => t1;
T1 positionalArgumentsFunc1(T1 t1, T1 t2, [T1 t3, T1 t4]) => t2;

X namedArgumentsFunc2<X>(X t1, X t2, {X t3, X t4}) => t1;
X positionalArgumentsFunc2<X>(X t1, X t2, [X t3, X t4]) => t2;

class C1 {
  static T1 namedArgumentsStaticFunc(T1 t1, T1 t2, {T1 t3, T1 t4}) => t1;
  static T1 positionalArgumentsStaticFunc(T1 t1, T1 t2, [T1 t3, T1 t4]) => t2;

  T1 namedArgumentsFunc(T1 t1, T1 t2, {T1 t3, T1 t4}) => t1;
  T1 positionalArgumentsFunc(T1 t1, T1 t2, [T1 t3, T1 t4]) => t2;
}

class C2<X> {
  X namedArgumentsFunc(X t1, X t2, {X t3, X t4}) => t1;
  X positionalArgumentsFunc(X t1, X t2, [X t3, X t4]) => t2;
}

T1 namedArgumentsFunc3(T1 t1, {T1 t2}) => t1;
T1 positionalArgumentsFunc3(T1 t1, [T1 t2]) => t1;

class C3 {
  static T1 namedArgumentsStaticFunc(T1 t1, {T1 t2}) => t1;
  static T1 positionalArgumentsStaticFunc(T1 t1, [T1 t2]) => t1;

  T1 namedArgumentsFunc(T1 t1, {T1 t2}) => t1;
  T1 positionalArgumentsFunc(T1 t1, [T1 t2]) => t1;
}

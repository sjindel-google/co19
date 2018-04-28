/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as a return value of type T1
 * @author sgrekhov@unipro.ru
 */
part of co19_subtype_tests;

T1 returnValueTest1(dynamic t) => forgetType(t);
T1 returnValueTest2({dynamic t}) => forgetType(t);
T1 returnValueTest3([dynamic t]) => forgetType(t);

testReturnValue() {
  returnValueTest1(t0Instance);
  returnValueTest2(t: t0Instance);
  returnValueTest3(t0Instance);
}

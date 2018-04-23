/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Super-Interface: T0 is an interface type with super-interfaces S0,...Sn
 * - and Si <: T1 for some i
 * @description Check that if type T0 is an interface type with super-interfaces
 * S0,...Sn and and Si <: T1 for some i then instance of T0 can be assigned to
 * the T1 variable. Test that if there is no i, such that Si <: T1, then T0
 * is not subtype of T1 and TypeError is thrown
 * @author sgrekhov@unipro.ru
 */
import "../../../../Utils/expect.dart";
import "library_variable_lib.dart";

dynamic forgetType(dynamic d) => d;

main() {
  Expect.throws(() {
    libraryVariableT1 = forgetType(new T2());
  }, (e) => e is TypeError);
}

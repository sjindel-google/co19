/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
library library_variable_lib;

class T1 {}

abstract class S0 extends T1 {}
abstract class S1 {}
abstract class S2 {}

abstract class T0 implements S0, S1, S2  {}

class T2 implements S1, S2  {}

class T implements T0 {}

T0 libraryVariableT0;
T1 libraryVariableT1;
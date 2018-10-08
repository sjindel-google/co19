/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type alias declares a name for a type expression.
 * typeAlias:
 *   metadata typedef typeAliasBody
 * ;
 * typeAliasBody:
 *   functionTypeAlias
 * ;
 * functionTypeAlias:
 *   functionPrefix typeParameters? formalParameterList ’;’
 * ;
 * functionPrefix:
 *   returnType? identifier
 * ;
 * @description Checks that it is impossible to introduce alias for an abstract
 * class type.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

abstract class A {}
typedef A B;

main() {
  try {
    Expect.isFalse(null is B);
  } catch (x) {}
}

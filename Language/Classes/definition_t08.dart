/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 *   metadata abstract? class identifier typeParameters? (superclass mixins?)? 
 * interfaces? ‘{’ (metadata classMemberDefinition)* ‘}’ |
 *   metadata abstract? class mixinApplicationClass
 * ;
 * @description Checks that it is a compile-time error if both opening and 
 * closing curly brackets are missed in a class type definition with extends 
 * clause. Class body is empty.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class S {}
class A extends S

main() {
  A a = new A();}

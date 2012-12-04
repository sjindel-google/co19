/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library with a top level function main().
 * scriptDefinition:
 *   scriptTag? libraryDefinition
 * ;
 * @description Checks that it is not an error when a script (without a script tag)
 * includes an export directive.
 * @author rodionov
 * @reviewer kaigorodov
 */
library Scripts_A01_t23;
export "4_Library1.dart";

main() {
  var x;
}

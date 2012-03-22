/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a library to be used in the scope of another library.
 * libraryImport:
 * `#' `import' `(' stringLiteral (`, ' `prefix:
 * ' stringLiteral)? `) `;'
 * ;
 * @description Checks that it is a compile-time error when an import directive
 * with empty parentheses.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

#import();

main() {
  try {
    someVar = 0;
  } catch(var e) {}
}

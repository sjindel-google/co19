/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<String> readAsLinesSync({Encoding encoding: utf8})
 * Synchronously read the entire file contents as lines of text using the given
 * Encoding.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that a FileSystemException is thrown if the operation
 * fails
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory sandbox = getTempDirectorySync();
  File file = getTempFileSync(parent: sandbox);
  try {
    file.writeAsStringSync("Line 1\nLine 2\rLine3");
    file.deleteSync();
    Expect.throws(() {
      file.readAsLinesSync();
    }, (e) => e is FileSystemException);
  } finally {
    sandbox.delete(recursive: true);
  }
}

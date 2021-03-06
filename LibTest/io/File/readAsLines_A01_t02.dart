/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<String>> readAsLines({Encoding encoding: utf8})
 * Read the entire file contents as lines of text using the given Encoding.
 *
 * Returns a Future<List<String>> that completes with the lines once the file
 * contents has been read.
 * @description Checks that this method reads the entire file contents as lines
 * of text using the given Encoding. Test not empty file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory sandbox = getTempDirectorySync();
  File file = getTempFileSync(parent: sandbox);
  file.writeAsStringSync("File content");
  asyncStart();
  file.readAsLines().then((data) {
    Expect.listEquals(["File content"], data);
    asyncEnd();
  }).whenComplete(() {
    sandbox.delete(recursive: true);
  });
}

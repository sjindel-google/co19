/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> length()
 * Get the length of the file. Returns a Future<int> that completes with the
 * length in bytes.
 * @description Checks that this method returns the length of the file in bytes.
 * Test not empty file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory sandbox = getTempDirectorySync();

  List<int> bytes = [1, 2, 3, 17, 255];
  File file = getTempFileSync(parent: sandbox);
  file.writeAsBytesSync(bytes);
  asyncStart();
  file.length().then((int length) {
    Expect.equals(bytes.length, length);
    asyncEnd();
  }).whenComplete(() {
    sandbox.delete(recursive: true);
  });
}

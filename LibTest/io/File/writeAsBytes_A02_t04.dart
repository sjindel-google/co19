/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<File> writeAsBytes(
 * List<int> bytes, {
 * FileMode mode: FileMode.write,
 * bool flush: false
 * })
 * Write a list of bytes to a file.
 *
 * Opens the file, writes the list of bytes to it, and closes the file. Returns
 * a Future<File> that completes with this File object once the entire operation
 * has completed.
 *
 * By default writeAsBytes creates the file for writing and truncates the file
 * if it already exists. In order to append the bytes to an existing file, pass
 * FileMode.append as the optional mode parameter.
 *
 * If the argument flush is set to true, the data written will be flushed to the
 * file system before the returned future completes.
 * @description Checks that in a FileMode.read returned Future completes with a
 * FileSystemException. Test not existing file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = new File(getTempFilePath());
  asyncStart();
  file.writeAsBytes([0, 1, 2, 255], mode: FileMode.read).then((f) {
    Expect.fail("FileSystemException is expected");
  }, onError: (e) {
    Expect.isTrue(e is FileSystemException);
    Expect.isFalse(file.existsSync());
    asyncEnd();
  });
}

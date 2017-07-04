/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<FileStat> stat()
 * Calls the operating system's stat() function on the path of this
 * FileSystemEntity. Identical to FileStat.stat(this.path).
 *
 * Returns a Future<FileStat> object containing the data returned by stat().
 *
 * If the call fails, completes the future with a FileStat object with .type set
 * to FileSystemEntityType.NOT_FOUND and the other fields invalid.
 * @description Checks that this method identical to FileStat.stat(this.path)
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../../../Utils/file_utils.dart";

main() {
  Directory dir = getTempDirectorySync();
  asyncStart();
  dir.stat().then((FileStat fs) {
    FileStat.stat(dir.path).then((FileStat fs2) {
      try {
        Expect.equals(fs2.type, fs.type);
        Expect.equals(fs2.mode, fs.mode);
        Expect.equals(fs2.changed, fs.changed);
        Expect.equals(fs2.modified, fs.modified);
        Expect.equals(fs2.size, fs.size);
        Expect.equals(fs2.accessed, fs.accessed);
        asyncEnd();
      } finally {
        dir.delete(recursive: true);
      }
    });
  });
}

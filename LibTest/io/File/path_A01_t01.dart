/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String path
 * Get the path of the file.
 * @description Checks that this property returns the path of this file.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory sandbox = getTempDirectorySync();
  File tmp = getTempFileSync(parent: sandbox);
  try {
    File file = new File(tmp.path);
    Expect.equals(tmp.path, file.path);

    file = new File("NotExisting");
    Expect.equals("NotExisting", file.path);
  } finally {
    sandbox.delete(recursive: true);
  }
}

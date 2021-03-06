/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Directory parent
 * The directory containing this.
 * @description Checks that this property returns the directory containing this.
 * Test absolute path
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory sandbox = getTempDirectorySync();
  Directory parent = getTempDirectorySync(parent: sandbox);
  try {
    Link link = getTempLinkSync(parent: parent);
    Expect.equals(parent.path, link.parent.path);

    link = new Link(parent.path + Platform.pathSeparator + "NotExisting");
    Expect.equals(parent.path, link.parent.path);

    link = new Link(parent.path);
    Expect.equals(parent.parent.path, link.parent.path);
  } finally {
    sandbox.delete(recursive: true);
  }
}

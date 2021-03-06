/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Link absolute
 * Returns a Link instance whose path is the absolute path to this.
 * The absolute path is computed by prefixing a relative path with the current
 * working directory, and returning an absolute path unchanged.
 * @description Checks that this property returns a Link instance whose
 * path is the absolute path to this
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory sandbox = getTempDirectorySync();
  Link link = getTempLinkSync(parent: sandbox);
  try {
    Expect.isNotNull(link.absolute);
    Expect.equals(link.path, link.absolute.path);

    String fileName = getTempFileName(extension: "lnk");
    Link link2 = new Link(fileName);
    Expect.isNotNull(link2.absolute);
    Expect.equals(Directory.current.path + Platform.pathSeparator + fileName,
        link2.absolute.path);
  } finally {
    sandbox.delete(recursive: true);
  }
}

/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void close()
 * Closes the sink.
 *
 * This signals the end of the chunked conversion. This method is called when
 * converters are used as StreamTransformer's.
 * @description Checks that this method closes the sink.
 * @issue 29329
 * @author sgrekhov@unipro.ru
 */
library close_A01_t01;

import "dart:convert";
import "../../../Utils/expect.dart";

test(ChunkedConversionSink create(ChunkedConversionSink outSink)) {
  bool called = false;

  var outSink = new ChunkedConversionSink.withCallback((accumulated) {
    called = true;
    Expect.listEquals(["Кириллица"], accumulated);
  });

  ByteConversionSink inSink = create(outSink);
  var list = UTF8.encode("Кириллица");

  Expect.isFalse(called);
  inSink.add(list);
  Expect.isFalse(called);
  inSink.close();
  Expect.isTrue(called);

  list = UTF8.encode("прекрасна");
  inSink.add(list);
  inSink.close();
}
/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future<RawSecureSocket> first
 * The first element of the stream.
 * . . .
 * Except for the type of the error, this method is equivalent to
 * this.elementAt(0).
 *
 * @description Checks that if this is empty, method this.elementAt(0) completes
 * with an error not equal to the error thrown by [first].
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(InternetAddress address) {
  asyncStart();
  SecurityContext sc = new SecurityContext(withTrustedRoots: true);
  RawSecureServerSocket.bind(address, 0, sc).then((server) {
    server.elementAt(0).then((event) {
      Expect.fail('Future should be completed with Error');
    }, onError: (error) {
      Expect.isTrue(error is RangeError);
      asyncEnd();
    });
    server.close();
  });
}

main() {
  check(InternetAddress.ANY_IP_V4);
  check(InternetAddress.ANY_IP_V6);
  check(InternetAddress.LOOPBACK_IP_V4);
  check(InternetAddress.LOOPBACK_IP_V6);
}

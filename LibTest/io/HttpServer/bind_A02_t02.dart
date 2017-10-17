/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<HttpServer> bind(
 *  address,
 *  int port, {
 *  int backlog: 0,
 *  bool v6Only: false,
 *  bool shared: false
 * }).
 * ...
 * The address can either be a String or an InternetAddress. If address is a
 * String, bind will perform a InternetAddress.lookup and use the first value in
 * the list. To listen on the loopback adapter, which will allow only incoming
 * connections from the local host, use the value InternetAddress.LOOPBACK_IP_V4
 * or InternetAddress.LOOPBACK_IP_V6. To allow for incoming connection from the
 * network use either one of the values InternetAddress.ANY_IP_V4 or
 * InternetAddress.ANY_IP_V6 to bind to all interfaces or the IP address of a
 * specific interface.
 * @description Checks the case when [address] is an InternetAddress.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

main() async {
  String helloWorld = 'Hello, test world!';
  HttpServer server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 0);
  asyncStart();
  server.listen((HttpRequest request) {
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });

  asyncStart();
  HttpClient client = new HttpClient();
  client
      .getUrl(Uri.parse(
          "http://${InternetAddress.LOOPBACK_IP_V4.address}:${server.port}"))
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    Expect.equals(HttpStatus.OK, response.statusCode);
    response.transform(UTF8.decoder).listen((content) {
      Expect.equals(helloWorld, content);
      asyncEnd();
    });
  });
}
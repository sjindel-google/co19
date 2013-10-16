/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String stringify(Object object)
 * Serializes object into a JSON string.
 * Directly serializable values are num, String, bool, and Null, as well as some List and Map values.
 * For List, the elements must all be serializable.
 * For Map, the keys must be String and the values must be serializable.
 * @description Checks that num, String, bool, Null, List, and Map values are serialized correctly.
 * @note variable table in this test is used also in the test printOn_A01_t01.
 * @author kaigorodov
 */
import "../../Utils/expect.dart";
import "dart:json";

List<List<Object>> table=[
  [1234, "1234"],
  [3.1415926, "3.1415926"],
  ["String", '"String"'],
  [true, "true"],
  [false, "false"],
  [null, "null"],
  [new List(), "[]"],
  [[], "[]"],
  [[1], "[1]"],
  [[1.0, "str", null, [], {}],
  '[1.0,"str",null,[],{}]'],
  [new Map(), "{}"],
  [{}, "{}"],
  [{"str":"str", "emptyList":[], "emptyMap":{}, "null":null},
   '{"str":"str","emptyList":[],"emptyMap":{},"null":null}'],
];

main() {
  for (List<Object> pair in table) {
    String res=stringify(pair[0]);
    Expect.equals(pair[1], res);
  }
}
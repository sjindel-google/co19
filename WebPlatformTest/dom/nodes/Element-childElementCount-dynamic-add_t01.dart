/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/*
 * after web-platform-tests/dom/nodes/Element-childElementCount-dynamic-add.html
 *
 * @assertion Element.childElementCount
 * @description Test of Dynamic Adding of Elements
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

test(() {
  var body=document.body;
  var el=body.createFragment(""""
<p id="parentEl">The result of this test is
<span id="first_element_child">logged above.</span></p>
  """);
  body.append(el);
  var parentEl = document.getElementById("parentEl");
  var newChild = document.createElement("span");
  parentEl.append(newChild);
  assert_equals(parentEl.children.length, 2);
}, "Test of Dynamic Adding of Elements");

checkTestFailures();
}

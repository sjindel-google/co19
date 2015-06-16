/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description">This tests the parsing and retrieval of the overflow, overflow-x and overflow-y properties.</p>
      <div id="console"></div>

      <div id="tests_container">

      <div id="test0" style="overflow: auto"></div>
      <div id="test1" style="overflow: auto auto"></div>
      <div id="test2" style="overflow-x: scroll; overflow-y: scroll"></div>
      <div id="test3" style="overflow-x: overlay; overflow-y: hidden"></div>
      <div id="test4" style="overflow-x: auto"></div>
      <div id="test5" style="overflow-y: auto"></div>
      <div id="test6" style="overflow: invalid"></div>
      <div id="test7"></div>
      <div id="test8" style="overflow-y: -webkit-paged-x;"></div>
      <div id="test9" style="overflow: -webkit-paged-y;"></div>
      <div id="test10" style="overflow-x: visible; overflow-y: -webkit-paged-y;"></div>

      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var test0 = document.getElementById("test0");
  var test1 = document.getElementById("test1");
  var test2 = document.getElementById("test2");
  var test3 = document.getElementById("test3");
  var test4 = document.getElementById("test4");
  var test5 = document.getElementById("test5");
  var test6 = document.getElementById("test6");
  var test7 = document.getElementById("test6");
  var test8 = document.getElementById("test8");
  var test9 = document.getElementById("test9");
  var test10 = document.getElementById("test10");

  shouldBeEqualToString(test0.style.overflow, "auto");
  shouldBeEqualToString(test0.style.overflowX, "auto");
  shouldBeEqualToString(test0.style.overflowY, "auto");
  shouldBeEqualToString(test1.style.overflow, "");
  shouldBeEqualToString(test1.style.overflowX, "");
  shouldBeEqualToString(test1.style.overflowY, "");
  shouldBeEqualToString(test2.style.overflow, "scroll");
  shouldBeEqualToString(test2.style.overflowX, "scroll");
  shouldBeEqualToString(test2.style.overflowY, "scroll");
  shouldBeEqualToString(test3.style.overflow, "");
  shouldBeEqualToString(test3.style.overflowX, "overlay");
  shouldBeEqualToString(test3.style.overflowY, "hidden");
  shouldBeEqualToString(test4.style.overflow, "");
  shouldBeEqualToString(test4.style.overflowX, "auto");
  shouldBeEqualToString(test4.style.overflowY, "");
  shouldBeEqualToString(test5.style.overflow, "");
  shouldBeEqualToString(test5.style.overflowX, "");
  shouldBeEqualToString(test5.style.overflowY, "auto");
  shouldBeEqualToString(test6.style.overflow, "");
  shouldBeEqualToString(test6.style.overflowX, "");
  shouldBeEqualToString(test6.style.overflowY, "");
  shouldBeEqualToString(test7.style.overflow, "");
  shouldBeEqualToString(test7.style.overflowX, "");
  shouldBeEqualToString(test7.style.overflowY, "");
  shouldBeEqualToString(test8.style.overflowX, "");
  shouldBeEqualToString(test8.style.overflowY, "-webkit-paged-x");
  shouldBeEqualToString(test9.style.overflowX, "auto");
  shouldBeEqualToString(test9.style.overflowY, "-webkit-paged-y");
  shouldBeEqualToString(test10.style.overflowX, "visible");
  shouldBeEqualToString(test10.style.overflowY, "-webkit-paged-y");
}
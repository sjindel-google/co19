/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check if box-flex specified flexboxes expand or shrink
 * correctly. If you see any scrollbars, then the test has failed.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var f = new DocumentFragment.html('''
      <style>
      div.box {
        display: -moz-box;
        display: -webkit-box;
        display: box;
      }

      div.outer {
        width: 100px;
        height: 100px;
        background-color: red;
        -moz-box-align: top;
        -webkit-box-align: top;
        position: relative;
        overflow: auto;
      }

      div.vertical {
        -moz-box-orient: vertical;
        -webkit-box-orient: vertical;
        box-orient: vertical;
      }

      div.horizontal {
        -moz-box-orient: horizontal;
        -webkit-box-orient: horizontal;
        box-orient: horizontal;
      }

      div.verticalMiddle {
        width: 100px;
        height: 90px;
        background-color: black;
      }

      div.expandVerticalBottom {
        width: 10px;
        height: 5px;
        background-color: black;
        -moz-box-flex: 1;
        -webkit-box-flex: 1;
        box-flex: 1;
        border-left: 60px solid olive;
        border-top: 2px solid blue;
        padding-right: 30px;
        padding-bottom: 2px;
      }

      div.shrinkVerticalBottom {
        width: 10px;
        height: 20px;
        background-color: black;
        -moz-box-flex: 1;
        -webkit-box-flex: 1;
        box-flex: 1;
        border-left: 60px solid olive;
        border-top: 2px solid blue;
        padding-right: 30px;
        padding-bottom: 2px;
      }

      div.horizontalMiddle {
        width: 90px;
        height: 100px;
        background-color: black;
      }

      div.expandHorizontalRight {
        width: 5px;
        height: 10px;
        background-color: black;
        -moz-box-flex: 1;
        -webkit-box-flex: 1;
        box-flex: 1;
        border-left: 2px solid olive;
        border-top: 60px solid blue;
        padding-right: 2px;
        padding-bottom: 30px;
      }

      div.shrinkHorizontalRight {
        width: 20px;
        height: 10px;
        background-color: black;
        -moz-box-flex: 1;
        -webkit-box-flex: 1;
        box-flex: 1;
        border-left: 2px solid olive;
        border-top: 60px solid blue;
        padding-right: 2px;
        padding-bottom: 30px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div class="box vertical outer" id="expandVertical">
        <div class="verticalMiddle"></div>
        <div class="expandVerticalBottom"></div>
      </div>
      <div class="box vertical outer" id="shrinkVertical">
        <div class="verticalMiddle"></div>
        <div class="shrinkVerticalBottom"></div>
      </div>
      <div class="box horizontal outer" id="expandHorizontal">
        <div class="horizontalMiddle"></div>
        <div class="expandHorizontalRight"></div>
      </div>
      <div class="box horizontal outer" id="shrinkHorizontal">
        <div class="horizontalMiddle"></div>
        <div class="shrinkHorizontalRight"></div>
      </div>
      <p id="description"></p>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var element = null;

  debug("vertically expanding");
  element = document.getElementById("expandVertical");
  shouldBe(element.scrollHeight, 100);
  shouldBe(element.scrollWidth, 100);

  debug("vertically shrinking");
  element = document.getElementById("shrinkVertical");
  shouldBe(element.scrollHeight, 100);
  shouldBe(element.scrollWidth, 100);

  debug("horizontally expanding");
  element = document.getElementById("expandHorizontal");
  shouldBe(element.scrollHeight, 100);
  shouldBe(element.scrollWidth, 100);

  debug("horizontally shrinking");
  element = document.getElementById("shrinkHorizontal");
  shouldBe(element.scrollHeight, 100);
  shouldBe(element.scrollWidth, 100);
}

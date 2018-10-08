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
import "../../resources/check-layout.dart";

main() {
  var f = new DocumentFragment.html('''
      <style>
      .table {
          display: table;
          border: 5px solid salmon;
          padding: 5px;
      }
      .td {
          display: table-cell;
          border: 5px solid orange;
      }
      .child {
          display: inline-block;
          width: 50px;
          height: 20px;
          background-color: pink;
      }
      .collapse {
          border-collapse: collapse;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div class="table" data-expected-width=134>
          <div class="td" data-expected-width=114>
              <div class="child"></div>
              <div class="child"></div>
          </div>
      </div>

      <div class="table" style="width: -webkit-min-content" data-expected-width=80>
          <div class="td" data-expected-width=60>
              <div class="child"></div>
              <div class="child"></div>
          </div>
      </div>

      <div class="table" style="width: -webkit-max-content" data-expected-width=134>
          <div class="td" data-expected-width=114>
              <div class="child"></div>
              <div class="child"></div>
          </div>
      </div>

      <div class="table" style="width: -webkit-fit-content" data-expected-width=134>
          <div class="td" data-expected-width=114>
              <div class="child"></div>
              <div class="child"></div>
          </div>
      </div>

      <div style="width: 134px">
          <div class="table" style="width: -webkit-fit-content" data-expected-width=134>
              <div class="td" data-expected-width=114>
                  <div class="child"></div>
                  <div class="child"></div>
              </div>
          </div>
      </div>

      <div style="width: 133px">
          <div class="table" style="width: -webkit-fit-content" data-expected-width=133>
              <div class="td" data-expected-width=113>
                  <div class="child"></div>
                  <div class="child"></div>
              </div>
          </div>
      </div>

      <div style="width: 400px">
          <div class="table" style="width: -webkit-fill-available"  data-expected-width=400>
              <div class="td" data-expected-width=380>
                  <div class="child"></div>
                  <div class="child"></div>
              </div>
          </div>
      <div>

      <div class="table collapse" data-expected-width=114>
          <div class="td" data-expected-width=109>
              <div class="child"></div>
              <div class="child"></div>
          </div>
      </div>

      <div class="table collapse" style="width: -webkit-min-content" data-expected-width=60>
          <div class="td" data-expected-width=55>
              <div class="child"></div>
              <div class="child"></div>
          </div>
      </div>

      <div class="table collapse" style="width: -webkit-max-content" data-expected-width=114>
          <div class="td" data-expected-width=109>
              <div class="child"></div>
              <div class="child"></div>
          </div>
      </div>

      <div class="table collapse" style="width: -webkit-fit-content" data-expected-width=114>
          <div class="td" data-expected-width=109>
              <div class="child"></div>
              <div class="child"></div>
          </div>
      </div>

      <div style="width: 114px">
          <div class="table collapse" style="width: -webkit-fit-content" data-expected-width=114>
              <div class="td" data-expected-width=109>
                  <div class="child"></div>
                  <div class="child"></div>
              </div>
          </div>
      </div>

      <div style="width: 113px">
          <div class="table collapse" style="width: -webkit-fit-content" data-expected-width=113>
              <div class="td" data-expected-width=108>
                  <div class="child"></div>
                  <div class="child"></div>
              </div>
          </div>
      </div>

      <div style="width: 400px">
          <div class="table collapse" style="width: -webkit-fill-available"  data-expected-width=400>
              <div class="td" data-expected-width=395>
                  <div class="child"></div>
                  <div class="child"></div>
              </div>
          </div>
      <div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.table');
    asyncEnd();
  });
}

/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
<table style="width:100px; height: 100px; border: 1px solid;" cellspacing=0 cellpadding=0>
  <tr> 
    <td style="padding:10px 5px"><img id='cell-contents' style="width: 100%; height: 100%; border:5px solid blue"></td>
  </tr>
</table>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    shouldBe(document.getElementById('cell-contents').offsetHeight, 78);
    // FIXME: We currently get 98 for this value. It appears we don't take left/right padding
    // into account for the widths of the contents of table cells.
    // We do still offset the contents by the padding, so they end up overflowing the table cell.
    // Firefox 12 has the same crazy behavior. Is this a bug or are tables just crazy?
    shouldBe(document.getElementById('cell-contents').offsetWidth, 88);
    checkTestFailures();
}

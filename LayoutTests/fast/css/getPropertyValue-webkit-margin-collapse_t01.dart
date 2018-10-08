/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description https://bugs.webkit.org/show_bug.cgi?id=110903
 * Bug 110903: getPropertyValue for -webkit-margin-collapse returns null,
 * should compute the shorthand value
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
        .test {
          display: inline-block;
          width: 5em;
          height: 10em;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="margin-collapse1" class="test" style="-webkit-margin-collapse: collapse separate;"></div>
      <div id="margin-collapse2" class="test" style="-webkit-margin-collapse: discard;"></div>
      <div id="margin-collapse3" class="test" style="-webkit-margin-before-collapse: discard; -webkit-margin-after-collapse: separate;"></div>
      <div id="margin-collapse4" class="test" style="-webkit-margin-collapse: foo;"></div>
      <div id="margin-collapse5" class="test" style="-webkit-margin-before-collapse: collapse;"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  webkitMarginCollapseValue(id) {
    var element = document.getElementById(id);
    return element.style.getPropertyValue("-webkit-margin-collapse");
  }

  shouldBe(webkitMarginCollapseValue("margin-collapse1"), 'collapse separate');
  shouldBe(webkitMarginCollapseValue("margin-collapse2"), 'discard discard');
  shouldBe(webkitMarginCollapseValue("margin-collapse3"), 'discard separate');
  debug("NOTE: 'foo' is an illegal CSS value for '-webkit-margin-collapse'.");
  //shouldBe(webkitMarginCollapseValue("margin-collapse4"), null);
  shouldBe(webkitMarginCollapseValue("margin-collapse4"), '');
  debug("NOTE: If only few longhand properties are specified, getPropertyValue for shorthand property returns null.");
  //shouldBe(webkitMarginCollapseValue("margin-collapse5"), null);
  shouldBe(webkitMarginCollapseValue("margin-collapse5"), '');
}

/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks validity.patternMismatch.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  DocumentFragment f = new DocumentFragment.html('''
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml(r'''
<p id="description"></p>
<div id="console"></div>
<div id=container>
<input id="simple" pattern="[0-9][A-Z]{3}" value="0AAA"
/><input id="no-pattern-and-no-value" 
/><input id="ip-address" type="text" pattern="\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b" value="127.0.0.1" 
/><input id="email-address" type="text" pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" value="someone@somewhere.com" 
/><input id="wrong-email-address" type="text" pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" value="Wrong!"
/><input id="match-1" type="text" pattern="\b(word1|word2|word3)(?:\W+\w+){1,6}?\W+(word1|word2|word3)\b" value="word1 near word2" 
/><input id="match-2" type="text" pattern=".{5,}" value="12345" 
/><input id="match-3" type="text" pattern=".{5,}" value="*(@$!" 
/><input id="match-4" type="text" pattern=".{5,}" value="*(@^$!" 
/><input id="match-5" type="text" pattern="0|1|2|3|4|5|6|7|8|" value="3" 
/><input id="match-6" type="text" pattern="^(foo).*" value="foo"
/><input id="match-7" type="text" pattern="^(foo).*" value="fooo"
/><input id="match-8" type="text" pattern="\w" value="f"
/><input id="match-9" type="text" pattern="\." value="."
/><input id="match-10" type="text" pattern="\)\(" value=")("
/><input id="match-11" type="text" pattern="ab" value="ab"
/><input id="match-12" type="text" pattern="^ab" value="ab"
/><input id="match-13" type="text" pattern="^\(" value="("
/><input id="match-14" type="text" pattern="...\)\(..." value="aaa)(bbb"
/><input id="match-15" type="text" pattern="^" value=""
/><input id="match-16" type="text" pattern="$" value=""
/><input id="match-17" type="text" pattern="foobar" value="" />
<input id="match-18" type="text" pattern="[0-9]|10|11|12" value="10" />
<input id="match-19" type="text" pattern="10|11|12|[0-9]" value="12" />
<input id="match-20" type="text" pattern="f(o|e)\1" value="foo" />
<input id="empty-pattern-match" type="text" pattern="" value="" />
<input id="wrong-gray-or-grey" type="text" pattern="gr[ae]y" value="Wrong!"
/><input id="gray" type="text" pattern="gr[ae]y" value="gray"
/><input id="grey" type="text" pattern="gr[ae]y" value="grey"
/><input id="empty-gray-or-grey" type="text" pattern="gr[ae]y" value=""
/><input id="mismatch-1" type="text" pattern="((4\.[0-3])|(2\.[0-3]))" value="Something 4.0"
/><input id="mismatch-2" type="text" pattern="\w" value="*"
/><input id="mismatch-3" type="email" pattern="[0-9]" value="something"
/><input id="mismatch-4" type="text" pattern=".{5,}" value="1234" 
/><input id="mismatch-5" type="text" pattern=".{5,}" value="*)$!" 
/><input id="mismatch-6" type="text" pattern=".{5,}" value="(^$!" 
/><input id="mismatch-7" type="text" pattern="0|1|2|3|4|5|6|7|8|" value="a" 
/><input id="mismatch-8" type="text" pattern="^(foo).*" value="a foo"
/><input id="mismatch-9" type="text" pattern="\w" value="134"
/><input id="mismatch-10" type="text" pattern="\." value="\."
/><input id="mismatch-11" type="text" pattern="\)\(" value=") ("
/><input id="mismatch-12" type="text" pattern="ab" value="a"
/><input id="mismatch-13" type="text" pattern="ab" value="b"
/><input id="mismatch-14" type="text" pattern="^ab" value="abc"
/><input id="mismatch-15" type="text" pattern="^\(" value="(something"
/><input id="mismatch-16" type="text" pattern="\)\\" value="something)\"
/><input id="mismatch-17" type="text" pattern="...\)\([b]{3}" value="adf)(bbbTEST"
/><input id="mismatch-18" type="text" pattern="foo\\" value="food"
/><input id="mismatch-19" type="text" pattern="^" value="wrong"
/><input id="mismatch-20" type="text" pattern="$" value="wrong"
/><input id="mismatch-21" type="text" pattern="f(o|e)\1" value="foe"/>

<input id="invalid-01" type="text" pattern=")foo(" value="foo"/>
<input id="invalid-02" type="text" pattern=")foo(" value="foobar"/>
<input id="invalid-03" type="text" pattern=")foo(" value=")foo"/>
<input id="invalid-04" type="text" pattern="foo\" value="foo\"/>
<input id="invalid-05" type="text" pattern="[0-9" value="1"/>
<input id="invalid-06" type="text" pattern="[0-9" value="a"/>

<input id="empty-pattern-mismatch" type="text" pattern="" value="Lorem Ipsum"
/><input id="disabled" pattern="[0-9][A-Z]{3}" value="00AA" disabled /></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  bool patternMismatchFor(String id) {
    return (document.getElementById(id) as InputElementBase).validity.patternMismatch;
  }

  shouldBeFalse(patternMismatchFor("simple"));
  shouldBeFalse(patternMismatchFor("no-pattern-and-no-value"));
  shouldBeFalse(patternMismatchFor("ip-address"));
  shouldBeFalse(patternMismatchFor("email-address"));
  shouldBeTrue(patternMismatchFor("wrong-email-address"));

  shouldBeFalse(patternMismatchFor("match-1"));
  shouldBeFalse(patternMismatchFor("match-2"));
  shouldBeFalse(patternMismatchFor("match-3"));
  shouldBeFalse(patternMismatchFor("match-4"));
  shouldBeFalse(patternMismatchFor("match-5"));
  shouldBeFalse(patternMismatchFor("match-6"));
  shouldBeFalse(patternMismatchFor("match-7"));
  shouldBeFalse(patternMismatchFor("match-8"));
  shouldBeFalse(patternMismatchFor("match-9"));
  shouldBeFalse(patternMismatchFor("match-10"));
  shouldBeFalse(patternMismatchFor("match-11"));
  shouldBeFalse(patternMismatchFor("match-12"));
  shouldBeFalse(patternMismatchFor("match-13"));
  shouldBeFalse(patternMismatchFor("match-14"));
  shouldBeFalse(patternMismatchFor("match-15"));
  shouldBeFalse(patternMismatchFor("match-16"));
  shouldBeFalse(patternMismatchFor("match-17"));
  shouldBeFalse(patternMismatchFor("match-18"));
  shouldBeFalse(patternMismatchFor("match-19"));
  shouldBeFalse(patternMismatchFor("match-20"));

  shouldBeTrue(patternMismatchFor("wrong-gray-or-grey"));
  shouldBeFalse(patternMismatchFor("gray"));
  shouldBeFalse(patternMismatchFor("grey"));
  shouldBeFalse(patternMismatchFor("empty-gray-or-grey"));

  shouldBeTrue(patternMismatchFor("mismatch-1"));
  shouldBeTrue(patternMismatchFor("mismatch-2"));
  shouldBeTrue(patternMismatchFor("mismatch-3"));
  shouldBeTrue(patternMismatchFor("mismatch-4"));
  shouldBeTrue(patternMismatchFor("mismatch-5"));
  shouldBeTrue(patternMismatchFor("mismatch-6"));
  shouldBeTrue(patternMismatchFor("mismatch-7"));
  shouldBeTrue(patternMismatchFor("mismatch-8"));
  shouldBeTrue(patternMismatchFor("mismatch-9"));
  shouldBeTrue(patternMismatchFor("mismatch-10"));
  shouldBeTrue(patternMismatchFor("mismatch-11"));
  shouldBeTrue(patternMismatchFor("mismatch-12"));
  shouldBeTrue(patternMismatchFor("mismatch-13"));
  shouldBeTrue(patternMismatchFor("mismatch-14"));
  shouldBeTrue(patternMismatchFor("mismatch-15"));
  shouldBeTrue(patternMismatchFor("mismatch-16"));
  shouldBeTrue(patternMismatchFor("mismatch-17"));
  shouldBeTrue(patternMismatchFor("mismatch-18"));
  shouldBeTrue(patternMismatchFor("mismatch-19"));
  shouldBeTrue(patternMismatchFor("mismatch-20"));
  shouldBeTrue(patternMismatchFor("mismatch-21"));

  shouldBeFalse(patternMismatchFor("empty-pattern-match"));
  shouldBeTrue(patternMismatchFor("empty-pattern-mismatch"));

  shouldBeFalse(patternMismatchFor("invalid-01"));
  shouldBeFalse(patternMismatchFor("invalid-02"));
  shouldBeFalse(patternMismatchFor("invalid-03"));
  shouldBeFalse(patternMismatchFor("invalid-04"));
  shouldBeFalse(patternMismatchFor("invalid-05"));
  shouldBeFalse(patternMismatchFor("invalid-06"));

  shouldBeFalse(patternMismatchFor("disabled"));

  document.getElementById('container').remove();
}

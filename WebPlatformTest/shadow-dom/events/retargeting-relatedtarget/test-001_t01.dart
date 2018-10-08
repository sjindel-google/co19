/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * @assertion Retargeting relatedTarget: Event retargeting is a process of 
 * computing relative targets for each ancestor of the node at which the event
 * is dispatched. A relative target is a DOM node that most accurately 
 * represents the target of a dispatched event at a given ancestor while 
 * maintaining the upper boundary encapsulation.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  var d = document;

  var host = d.createElement('div');
  host.setAttribute('style', 'height:100%; width:100%');
  host.setAttribute('id', 'host');
  d.body.append(host);

  //Shadow root to play with
  var s = createSR(host);

  var div1 = d.createElement('div');
  div1.setAttribute('style', 'height:40px; width:100%');
  div1.setAttribute('id', 'div1');
  s.append(div1);

  var div2 = d.createElement('div');
  div2.setAttribute('style', 'height:40px; width:100%');
  div2.setAttribute('id', 'div2');
  s.append(div2);

  asyncStart();

  s.addEventListener('mouseover', (event) {
    assert_equals(event.relatedTarget.getAttribute('id'), 'div1', 'Wrong relatedTarget');
    asyncEnd();
  }, false);

  d.body.addEventListener('mouseover', (event) {
    assert_true(false, 'Event must be stopped at Shadow boundary');
  }, false);

  var evt = new MouseEvent("mouseover", canBubble: true, cancelable: false,
      view: window, detail: 0,
      screenX: 10, screenY: 10, clientX: 10, clientY: 10,
      ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
      button: 0, relatedTarget: div1);

  div2.dispatchEvent(evt);
}

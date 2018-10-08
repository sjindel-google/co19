/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description A canvas globalCompositeOperation test with alpha blending
 */
import "dart:html";
import "../../testcommon.dart";

class DrawPolicy {
  var drawSource;
  var drawDestination;
  var drawComposition;
  var name;
  DrawPolicy({drawSource,drawDestination,drawComposition,name}) {
    this.drawSource = drawSource;
    this.drawDestination = drawDestination;
    this.drawComposition = drawComposition;
    this.name = name;
  }
}

main() {
  var style = new Element.html('''
      <style type="text/css">
        body { margin: 20px; font-family: arial,verdana,helvetica; background: #fff;}
        h1 { font-size: 140%; font-weight:normal; color: #036; border-bottom: 1px solid #ccc; }
        canvas { border: 2px solid #000; margin-bottom: 5px; }
        table { background: #00f; }
        th { font-size: 70%; padding: 0; }
        td { font-size: 70%; padding: 0; }
        pre { float:left; display:block; background: rgb(238,238,238); border: 1px dashed #666; padding: 15px 20px; margin: 0 0 10px 0; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>This test exercises a bunch of alpha composition checks with stroking. The top-left rectangles are the source images and bottom-right rectangles are the destination images.</p>
      <div id="results">
      </div>
      <textarea id="debug"></textarea>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var compositeTypes = [
    'source-over','source-in','source-out','source-atop',
    'destination-over','destination-in','destination-out','destination-atop',
    'lighter','copy','xor'
  ];
  var inputColors = [
  { 'source': [255, 0, 0, 255], 'destination': [0, 255, 0, 255] },
  { 'source': [255, 0, 0, 255], 'destination': [0, 255, 0, 0] },
  { 'source': [255, 0, 0, 255], 'destination': [0, 255, 0, 1] },
  { 'source': [0, 255, 0, 0], 'destination': [255, 0, 0, 255] },
  { 'source': [0, 255, 0, 1], 'destination': [255, 0, 0, 255] },
  { 'source': [255, 0, 0, 0], 'destination': [0, 255, 0, 255] },
  { 'source': [255, 0, 0, 127], 'destination': [0, 255, 0, 127] },
  { 'source': [255, 0, 0, 255], 'destination': [0, 255, 0, 127] },
  { 'source': [255, 0, 0, 127], 'destination': [0, 255, 0, 255] },
  { 'source': [127, 0, 0, 255], 'destination': [0, 127, 0, 127] },
  { 'source': [127, 0, 0, 127], 'destination': [0, 127, 0, 255] },
  { 'source': [255, 0, 0, 127], 'destination': [255, 0, 0, 63] },
  { 'source': [255, 127, 0, 32], 'destination': [255, 63, 0, 63] },
  { 'source': [255, 0, 0, 191], 'destination': [0, 255, 0, 127] },
  { 'source': [255, 0, 255, 191], 'destination': [0, 255, 255, 127] }
  ];
  var expectedColors = [
    [
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 255, 0, 1] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 255], 'destination': [255, 0, 0, 255] },
    { 'source': [0, 255, 0, 1], 'composition': [254, 1, 0, 255], 'destination': [255, 0, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [255, 0, 0, 127], 'composition': [170, 84, 0, 190], 'destination': [0, 255, 0, 127] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 255, 0, 127] },
    { 'source': [255, 0, 0, 127], 'composition': [127, 128, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [127, 0, 0, 255], 'composition': [127, 0, 0, 255], 'destination': [0, 126, 0, 127] },
    { 'source': [126, 0, 0, 127], 'composition': [63, 63, 0, 255], 'destination': [0, 127, 0, 255] },
    { 'source': [255, 0, 0, 127], 'composition': [255, 0, 0, 158], 'destination': [255, 0, 0, 63] },
    { 'source': [255, 127, 0, 32], 'composition': [255, 85, 0, 87], 'destination': [255, 64, 0, 63] },
    { 'source': [255, 0, 0, 191], 'composition': [219, 35, 0, 222], 'destination': [0, 255, 0, 127] },
    { 'source': [255, 0, 255, 191], 'composition': [219, 35, 255, 222], 'destination': [0, 255, 255, 127] }
  ],
    [
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 64], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 127], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 127], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [128, 0, 0, 127], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [126, 0, 0, 127], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 32], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 127, 0, 8], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 96], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 255, 96], 'destination': [0, 0, 0, 0] }
  ],
    [
    { 'source': [255, 0, 0, 255], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 254], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 255, 0, 1], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 127], 'composition': [255, 0, 0, 64], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 128], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 127], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [127, 0, 0, 255], 'composition': [127, 0, 0, 128], 'destination': [0, 0, 0, 0] },
    { 'source': [126, 0, 0, 127], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 127], 'composition': [255, 0, 0, 96], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 127, 0, 32], 'composition': [255, 132, 0, 25], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 191], 'composition': [255, 0, 0, 96], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 255, 191], 'composition': [255, 0, 255, 96], 'destination': [0, 0, 0, 0] }
  ],
    [
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 1], 'destination': [0, 255, 0, 1] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 255], 'destination': [255, 0, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [254, 1, 0, 255], 'destination': [255, 0, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [126, 126, 0, 127], 'destination': [0, 255, 0, 127] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 127], 'destination': [0, 255, 0, 127] },
    { 'source': [0, 0, 0, 0], 'composition': [127, 128, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [128, 0, 0, 127], 'destination': [0, 126, 0, 127] },
    { 'source': [0, 0, 0, 0], 'composition': [63, 63, 0, 255], 'destination': [0, 127, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 63], 'destination': [255, 0, 0, 63] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 68, 0, 63], 'destination': [255, 64, 0, 63] },
    { 'source': [0, 0, 0, 0], 'composition': [190, 62, 0, 127], 'destination': [0, 255, 0, 127] },
    { 'source': [0, 0, 0, 0], 'composition': [190, 62, 255, 127], 'destination': [0, 255, 255, 127] }
  ],
    [
    { 'source': [255, 0, 0, 255], 'composition': [0, 255, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 255], 'composition': [254, 1, 0, 255], 'destination': [0, 255, 0, 1] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 255], 'destination': [255, 0, 0, 255] },
    { 'source': [0, 255, 0, 1], 'composition': [255, 0, 0, 255], 'destination': [255, 0, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [255, 0, 0, 127], 'composition': [84, 170, 0, 190], 'destination': [0, 255, 0, 127] },
    { 'source': [255, 0, 0, 255], 'composition': [128, 127, 0, 255], 'destination': [0, 255, 0, 127] },
    { 'source': [255, 0, 0, 127], 'composition': [0, 255, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [127, 0, 0, 255], 'composition': [63, 63, 0, 255], 'destination': [0, 126, 0, 127] },
    { 'source': [126, 0, 0, 127], 'composition': [0, 127, 0, 255], 'destination': [0, 127, 0, 255] },
    { 'source': [255, 0, 0, 127], 'composition': [255, 0, 0, 158], 'destination': [255, 0, 0, 63] },
    { 'source': [255, 127, 0, 32], 'composition': [255, 82, 0, 87], 'destination': [255, 64, 0, 63] },
    { 'source': [255, 0, 0, 191], 'composition': [109, 145, 0, 222], 'destination': [0, 255, 0, 127] },
    { 'source': [255, 0, 255, 191], 'composition': [109, 145, 255, 222], 'destination': [0, 255, 255, 127] }
  ],
    [
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 1], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 1], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 64], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 127], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 127], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 126, 0, 127], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 128, 0, 127], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 32], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 95, 0, 8], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 96], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 255, 96], 'destination': [0, 0, 0, 0] }
  ],
    [
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 255, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 255, 0, 1] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 255], 'destination': [255, 0, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 254], 'destination': [255, 0, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 64], 'destination': [0, 255, 0, 127] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 255, 0, 127] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 128], 'destination': [0, 255, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 126, 0, 127] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 127, 0, 128], 'destination': [0, 127, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 32], 'destination': [255, 0, 0, 63] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 63, 0, 56], 'destination': [255, 64, 0, 63] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 32], 'destination': [0, 255, 0, 127] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 255, 32], 'destination': [0, 255, 255, 127] }
  ],
    [
    { 'source': [255, 0, 0, 255], 'composition': [0, 255, 0, 255], 'destination': [0,0,0,0] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 255], 'composition': [254, 1, 0, 255], 'destination': [0,0,0,0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0,0,0,0] },
    { 'source': [0, 255, 0, 1], 'composition': [255, 0, 0, 1], 'destination': [0,0,0,0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0,0,0,0] },
    { 'source': [255, 0, 0, 127], 'composition': [126, 126, 0, 127], 'destination': [0,0,0,0] },
    { 'source': [255, 0, 0, 255], 'composition': [128, 127, 0, 255], 'destination': [0,0,0,0] },
    { 'source': [255, 0, 0, 127], 'composition': [0, 255, 0, 127], 'destination': [0,0,0,0] },
    { 'source': [127, 0, 0, 255], 'composition': [63, 63, 0, 255], 'destination': [0,0,0,0] },
    { 'source': [126, 0, 0, 127], 'composition': [0, 126, 0, 127], 'destination': [0,0,0,0] },
    { 'source': [255, 0, 0, 127], 'composition': [255, 0, 0, 127], 'destination': [0,0,0,0] },
    { 'source': [255, 127, 0, 32], 'composition': [255, 111, 0, 32], 'destination': [0,0,0,0] },
    { 'source': [255, 0, 0, 191], 'composition': [126, 126, 0, 191], 'destination': [0,0,0,0] },
    { 'source': [255, 0, 255, 191], 'composition': [126, 126, 255, 191], 'destination': [0,0,0,0] }
  ],
    [
    { 'source': [255, 0, 0, 255], 'composition': [255, 255, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 1, 0, 255], 'destination': [0, 255, 0, 1] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 255], 'destination': [255, 0, 0, 255] },
    { 'source': [0, 255, 0, 1], 'composition': [255, 1, 0, 255], 'destination': [255, 0, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [255, 0, 0, 127], 'composition': [127, 127, 0, 254], 'destination': [0, 255, 0, 127] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 127, 0, 255], 'destination': [0, 255, 0, 127] },
    { 'source': [255, 0, 0, 127], 'composition': [127, 255, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [127, 0, 0, 255], 'composition': [127, 63, 0, 255], 'destination': [0, 126, 0, 127] },
    { 'source': [126, 0, 0, 127], 'composition': [63, 127, 0, 255], 'destination': [0, 127, 0, 255] },
    { 'source': [255, 0, 0, 127], 'composition': [255, 0, 0, 190], 'destination': [255, 0, 0, 63] },
    { 'source': [255, 127, 0, 32], 'composition': [255, 85, 0, 95], 'destination': [255, 64, 0, 63] },
    { 'source': [255, 0, 0, 191], 'composition': [191, 127, 0, 255], 'destination': [0, 255, 0, 127] },
    { 'source': [255, 0, 255, 191], 'composition': [191, 127, 255, 255], 'destination': [0, 255, 255, 127] }
  ],
    [
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 255, 0, 1], 'composition': [0, 255, 0, 1], 'destination': [0, 0, 0, 0] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 0, 0, 0], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 127], 'composition': [255, 0, 0, 127], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 127], 'composition': [255, 0, 0, 127], 'destination': [0, 0, 0, 0] },
    { 'source': [127, 0, 0, 255], 'composition': [127, 0, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [126, 0, 0, 127], 'composition': [126, 0, 0, 127], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 127], 'composition': [255, 0, 0, 127], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 127, 0, 32], 'composition': [255, 127, 0, 32], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 191], 'composition': [255, 0, 0, 191], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 255, 191], 'composition': [255, 0, 255, 191], 'destination': [0, 0, 0, 0] }
  ],
    [
    { 'source': [255, 0, 0, 255], 'composition': [0, 0, 0, 0], 'destination': [0, 255, 0, 255] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 255], 'destination': [0, 0, 0, 0] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 254], 'destination': [0, 255, 0, 1] },
    { 'source': [0, 0, 0, 0], 'composition': [255, 0, 0, 255], 'destination': [255, 0, 0, 255] },
    { 'source': [0, 255, 0, 1], 'composition': [255, 0, 0, 254], 'destination': [255, 0, 0, 255] },
    { 'source': [0, 0, 0, 0], 'composition': [0, 255, 0, 255], 'destination': [0, 255, 0, 255] },
    { 'source': [255, 0, 0, 127], 'composition': [126, 126, 0, 127], 'destination': [0, 255, 0, 127] },
    { 'source': [255, 0, 0, 255], 'composition': [255, 0, 0, 128], 'destination': [0, 255, 0, 127] },
    { 'source': [255, 0, 0, 127], 'composition': [0, 255, 0, 128], 'destination': [0, 255, 0, 255] },
    { 'source': [127, 0, 0, 255], 'composition': [127, 0, 0, 128], 'destination': [0, 126, 0, 127] },
    { 'source': [126, 0, 0, 127], 'composition': [0, 125, 0, 128], 'destination': [0, 127, 0, 255] },
    { 'source': [255, 0, 0, 127], 'composition': [255, 0, 0, 127], 'destination': [255, 0, 0, 63] },
    { 'source': [255, 127, 0, 32], 'composition': [255, 83, 0, 79], 'destination': [255, 64, 0, 63] },
    { 'source': [255, 0, 0, 191], 'composition': [190, 62, 0, 127], 'destination': [0, 255, 0, 127] },
    { 'source': [255, 0, 255, 191], 'composition': [190, 62, 255, 127], 'destination': [0, 255, 255, 127] }
  ]
  ];

  // Compare two colors with a few margin.
  isDifferentColor(actualColor, expectedColor)
  {
    var actualAlpha = actualColor[3];
    var expectedAlpha = expectedColor[3];
    if (abs(actualAlpha - expectedAlpha) > 3) return true;
    // For the value of RGB, we compare the values the users actually see.
    if (abs(actualColor[0] * actualAlpha / 256 - expectedColor[0] * expectedAlpha / 256) > 3) return true;
    if (abs(actualColor[1] * actualAlpha / 256 - expectedColor[1] * expectedAlpha / 256) > 3) return true;
    if (abs(actualColor[2] * actualAlpha / 256 - expectedColor[2] * expectedAlpha / 256) > 3) return true;
    return false;
  }

  getRGBAString(a)
  {
    return "rgba(" + [a[0], a[1], a[2], a[3] / 255.0].join(",") + ")";
  }

  drawTable(drawPolicy)
  {
    var tableElement = document.createElement("table");

    // Create a header for source color.
    var trElement = document.createElement("tr");
    tableElement.append(trElement);
    trElement.append(document.createElement("th"));
    for (var column = 0; column < inputColors.length; column++) {
      var inputColor = inputColors[column];
      var thElement = document.createElement("th");
      thElement.setAttribute("colspan", "2");
      thElement.text = "src " + inputColor['source'].join(", ");
      trElement.append(thElement);
    }

    // Create a header for destination color.
    trElement = document.createElement("tr");
    tableElement.append(trElement);
    trElement.append(document.createElement("th"));
    for (var column = 0; column < inputColors.length; column++) {
      var inputColor = inputColors[column];
      var thElement = document.createElement("th");
      thElement.setAttribute("colspan", "2");
      thElement.text = "dst " + inputColor['destination'].join(", ");
      trElement.append(thElement);
    }

    var resultsElement = document.getElementById("results");
    var titleElement = document.createElement("h1");
    titleElement.text = "Tests for " + drawPolicy.name;
    resultsElement.append(titleElement);
    resultsElement.append(tableElement);

    for (var row = 0; row < compositeTypes.length; row++){
      var type = compositeTypes[row];

      var trCanvasElement = document.createElement("tr");
      var thElement = document.createElement("th");
      thElement.setAttribute("rowspan", "2");
      thElement.text = type;
      trCanvasElement.append(thElement);
      var trMessageElement = document.createElement("tr");
      tableElement.append(trCanvasElement);
      tableElement.append(trMessageElement);

      for (var column = 0; column < inputColors.length; column++) {
        var inputColor = inputColors[column];
        var expectedColor = expectedColors[row][column];

        // Create canvas element for actual color.
        dynamic actualCanvasElement = document.createElement("canvas");
        actualCanvasElement.setAttribute("width", "25");
        actualCanvasElement.setAttribute("height", "25");
        var tdElement = document.createElement("td");
        tdElement.append(actualCanvasElement);
        trCanvasElement.append(tdElement);

        // Create canvas element for expected color.
        dynamic expectedCanvasElement = document.createElement("canvas");
        expectedCanvasElement.setAttribute("width", "25");
        expectedCanvasElement.setAttribute("height", "25");
        tdElement = document.createElement("td");
        tdElement.append(expectedCanvasElement);
        trCanvasElement.append(tdElement);

        // Create div element for pass/fail messages.
        var messageElement = document.createElement("div");
        tdElement = document.createElement("td");
        tdElement.setAttribute("colspan", "2");
        tdElement.append(messageElement);
        trMessageElement.append(tdElement);

        dynamic ctx = expectedCanvasElement.getContext("2d");
        ctx.lineWidth = 10;
        // Draw expected image.
        ctx.globalCompositeOperation = "copy";
        ctx.fillStyle = getRGBAString(expectedColor['destination']);
        ctx.strokeStyle = getRGBAString(expectedColor['destination']);
        drawPolicy.drawDestination(ctx);
        ctx.fillStyle = getRGBAString(expectedColor['source']);
        ctx.strokeStyle = getRGBAString(expectedColor['source']);
        drawPolicy.drawSource(ctx);
        ctx.fillStyle = getRGBAString(expectedColor['composition']);
        ctx.strokeStyle = getRGBAString(expectedColor['composition']);
        drawPolicy.drawComposition(ctx);

        ctx = actualCanvasElement.getContext("2d");
        ctx.lineWidth = 10;

        // Draw destination rectangle.
        ctx.globalCompositeOperation = "copy";
        ctx.fillStyle = getRGBAString(inputColor['destination']);
        ctx.strokeStyle = getRGBAString(inputColor['destination']);
        drawPolicy.drawDestination(ctx);

        // Draw source rectangle.
        ctx.globalCompositeOperation = type;
        ctx.fillStyle = getRGBAString(inputColor['source']);
        ctx.strokeStyle = getRGBAString(inputColor['source']);
        drawPolicy.drawSource(ctx);

        // Let's check if the results are expected or not.
        var errorSuffix = ", composite type: $type, source: ${inputColor['source']}, destination: ${inputColor['destination']}<br>";

        var results = "";
        // Note that (0, 0) may be affected by anti-alias.
        var img = ctx.getImageData(1, 1, 1, 1).data;
        var actualColor = [img[0], img[1], img[2], img[3]];
        if (isDifferentColor(actualColor, expectedColor['source'])) {
          results += "Unexpected source! expected: ${expectedColor['source']} actual: $actualColor $errorSuffix";
        }
        // Note that (24, 24) may be affected by anti-alias.
        img = ctx.getImageData(23, 23, 1, 1).data;
        actualColor = [img[0], img[1], img[2], img[3]];
        if (isDifferentColor(actualColor, expectedColor['destination'])) {
          results += "Unexpected destination! expected: ${expectedColor['destination']} actual: $actualColor $errorSuffix";
        }
        img = ctx.getImageData(12, 12, 1, 1).data;
        actualColor = [img[0], img[1], img[2], img[3]];
        if (isDifferentColor(actualColor, expectedColor['composition'])) {
          results += "Unexpected composition! expected: ${expectedColor['composition']} actual: $actualColor $errorSuffix";
        }

        if (results == "") {
          messageElement.style.backgroundColor = "green";
          messageElement.innerHtml = results = "OK";
        } else {
          messageElement.style.backgroundColor = "red";
          messageElement.innerHtml = results;
          testFailed(results);
        }

        // Dump colors into text area for debugging purpose.
        dynamic debugText = document.getElementById("debug");
        img = ctx.getImageData(0, 0, 1, 1).data;
        debugText.value += img.join(",") + "\n";
        img = ctx.getImageData(12, 12, 1, 1).data;
        debugText.value += img.join(",") + "\n";
        img = ctx.getImageData(24, 24, 1, 1).data;
        debugText.value += img.join(",") + "\n";
      }
    }
  }

  var useStrokeRect = new DrawPolicy(
      drawSource: (ctx) {
        ctx.strokeRect(5, 5, 10, 10);
      },

      drawDestination: (ctx) {
        ctx.fillRect(5, 5, 20, 20);
      },

      drawComposition: (ctx) {
        ctx.fillRect(5, 5, 15, 15);
      },

      name: "stroke rect");

  var usePathAndStroke = new DrawPolicy(
      drawSource: (ctx) {
        ctx.beginPath();
        ctx.moveTo(5, 5);
        ctx.lineTo(15, 5);
        ctx.lineTo(15, 15);
        ctx.lineTo(5, 15);
        ctx.closePath();
        ctx.stroke();
      },

      drawDestination: (ctx) {
        ctx.fillRect(5, 5, 20, 20);
      },

      drawComposition: (ctx) {
        ctx.fillRect(5, 5, 15, 15);
      },

      name: "path and stroke");

  draw()
  {
    drawTable(useStrokeRect);
    drawTable(usePathAndStroke);
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen((_) {
    draw();
  });
}

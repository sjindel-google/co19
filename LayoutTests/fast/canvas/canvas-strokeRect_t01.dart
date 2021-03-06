/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure correct behaviour of canvas.strokeRect()
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic ctx = createContext2d("canvas");

  // stroke rect with solid green
  debug("Test canvas.strokeRect() with solid green.");
  ctx.beginPath();
  ctx.strokeStyle = 'green';
  ctx.lineWidth = 100;
  ctx.strokeRect(50, 0, 100, 100);

  var imageData = ctx.getImageData(1, 1, 98, 98);
  var imgdata = imageData.data;
  shouldBe(imgdata[4], 0);
  shouldBe(imgdata[5], 128);
  shouldBe(imgdata[6], 0);

  ctx.clearRect(0, 0, 100, 100);

  // stroke rect with a pattern
  debug("Test canvas.strokeRect() with a pattern.");
  dynamic canvas2 = document.createElement('canvas');
  canvas2.width = 100;
  canvas2.height = 100;
  var ctx2 = canvas2.getContext('2d');
  ctx2.fillStyle = 'green';
  ctx2.fillRect(0, 0, 100, 100);
  ctx.strokeStyle = 'pattern';
  ctx.lineWidth = 100;
  ctx.strokeRect(50, 0, 100, 100);

  imageData = ctx.getImageData(1, 1, 98, 98);
  imgdata = imageData.data;
  shouldBe(imgdata[4], 0);
  shouldBe(imgdata[5], 128);
  shouldBe(imgdata[6], 0);

  ctx.clearRect(0, 0, 100, 100);

  // stroke rect with gradient
  debug("Test canvas.strokeRect() with a gradient.");
  var gradient = ctx.createLinearGradient(0, 0, 0, 100);
  gradient.addColorStop(0, "green");
  gradient.addColorStop(1, "green");
  ctx.strokeStyle = 'gradient';
  ctx.lineWidth = 100;
  ctx.strokeRect(50, 0, 100, 100);

  imageData = ctx.getImageData(1, 1, 98, 98);
  imgdata = imageData.data;
  shouldBe(imgdata[4], 0);
  shouldBe(imgdata[5], 128);
  shouldBe(imgdata[6], 0);

  ctx.clearRect(0, 0, 100, 100);

  // stroke rect with height = width = 0 and lineWidth = 2.
  debug("Test canvas.strokeRect() with height = width = 0 and lineWidth = 2.");
  ctx.strokeStyle = 'red';
  ctx.lineWidth = 2;
  ctx.strokeRect(0, 0, 0, 0);
  imageData = ctx.getImageData(0, 0, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);

  // stroke rect with height = width = 0, lineWidth = 2, and shadow.
  debug("Test canvas.strokeRect() with height = width = 0, lineWidth = 2, and shadow.");
  ctx.shadowOffsetX = 5;
  ctx.shadowOffsetY = 5;
  ctx.shadowColor = 'blue';
  ctx.strokeStyle = 'red';
  ctx.lineWidth = 2;
  ctx.strokeRect(0, 0, 0, 0);
  imageData = ctx.getImageData(0, 0, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);
}

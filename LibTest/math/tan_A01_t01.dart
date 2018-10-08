/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double tan(num radians)
 * Converts [radians] to a double and returns the tangent of the value.
 *
 * @description Checks set of values.
 *
 * @issue 26261
 * @author msyabro
 * @reviewer pagolubev
 * @3rdparty sputnik-v1: S15.8.2.18_A7.js
 * @needsreview Returned value precision is not specified.
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  int vnum = 64;
  var x = new List(64);
  x[0] = -1.57079632679489660000;
  x[1] = -1.52092977673791570000;
  x[2] = -1.47106322668093490000;
  x[3] = -1.42119667662395410000;
  x[4] = -1.37133012656697330000;
  x[5] = -1.32146357650999220000;
  x[6] = -1.27159702645301140000;
  x[7] = -1.22173047639603060000;
  x[8] = -1.17186392633904980000;
  x[9] = -1.12199737628206900000;
  x[10] = -1.07213082622508820000;
  x[11] = -1.02226427616810730000;
  x[12] = -0.97239772611112640000;
  x[13] = -0.92253117605414559000;
  x[14] = -0.87266462599716477000;
  x[15] = -0.82279807594018395000;
  x[16] = -0.77293152588320302000;
  x[17] = -0.72306497582622220000;
  x[18] = -0.67319842576924138000;
  x[19] = -0.62333187571226056000;
  x[20] = -0.57346532565527975000;
  x[21] = -0.52359877559829870000;
  x[22] = -0.47373222554131811000;
  x[23] = -0.42386567548433729000;
  x[24] = -0.37399912542735625000;
  x[25] = -0.32413257537037543000;
  x[26] = -0.27426602531339461000;
  x[27] = -0.22439947525641379000;
  x[28] = -0.17453292519943298000;
  x[29] = -0.12466637514245216000;
  x[30] = -0.07479982508547133900;
  x[31] = -0.02493327502849052000;
  x[32] = 0.02493327502849052000;
  x[33] = 0.07479982508547133900;
  x[34] = 0.12466637514245216000;
  x[35] = 0.17453292519943298000;
  x[36] = 0.22439947525641379000;
  x[37] = 0.27426602531339461000;
  x[38] = 0.32413257537037543000;
  x[39] = 0.37399912542735625000;
  x[40] = 0.42386567548433707000;
  x[41] = 0.47373222554131766000;
  x[42] = 0.52359877559829915000;
  x[43] = 0.57346532565527975000;
  x[44] = 0.62333187571226034000;
  x[45] = 0.67319842576924138000;
  x[46] = 0.72306497582622198000;
  x[47] = 0.77293152588320302000;
  x[48] = 0.82279807594018406000;
  x[49] = 0.87266462599716466000;
  x[50] = 0.92253117605414570000;
  x[51] = 0.97239772611112629000;
  x[52] = 1.02226427616810730000;
  x[53] = 1.07213082622508840000;
  x[54] = 1.12199737628206900000;
  x[55] = 1.17186392633905000000;
  x[56] = 1.22173047639603060000;
  x[57] = 1.27159702645301120000;
  x[58] = 1.32146357650999220000;
  x[59] = 1.37133012656697330000;
  x[60] = 1.42119667662395390000;
  x[61] = 1.47106322668093490000;
  x[62] = 1.52092977673791550000;
  x[63] = 1.57079632679489660000;


  var y = new List(64);
  y[0] = -16331239353195370.00000000000000000000;
  y[1] = -20.03689788997828100000;
  y[2] = -9.99349498241742220000;
  y[3] = -6.63456649978931170000;
  y[4] = -4.94671494494940060000;
  y[5] = -3.92724714760272690000;
  y[6] = -3.24192037576928720000;
  y[7] = -2.74747741945462160000;
  y[8] = -2.37228029184788760000;
  y[9] = -2.07652139657233640000;
  y[10] = -1.83630792973623100000;
  y[11] = -1.63642745273401610000;
  y[12] = -1.46673061342097340000;
  y[13] = -1.32018331365488460000;
  y[14] = -1.19175359259421000000;
  y[15] = -1.07774368351222650000;
  y[16] = -0.97537247158200291000;
  y[17] = -0.88250523616465493000;
  y[18] = -0.79747338888240393000;
  y[19] = -0.71895103828786056000;
  y[20] = -0.64586847728552887000;
  y[21] = -0.57735026918962551000;
  y[22] = -0.51267008667516678000;
  y[23] = -0.45121718317830323000;
  y[24] = -0.39247107881010240000;
  y[25] = -0.33598213147817668000;
  y[26] = -0.28135637451595324000;
  y[27] = -0.22824347439014994000;
  y[28] = -0.17632698070846500000;
  y[29] = -0.12531625823730441000;
  y[30] = -0.07493964001908703900;
  y[31] = -0.02493844305504610100;
  y[32] = 0.02493844305504610100;
  y[33] = 0.07493964001908703900;
  y[34] = 0.12531625823730441000;
  y[35] = 0.17632698070846500000;
  y[36] = 0.22824347439014994000;
  y[37] = 0.28135637451595324000;
  y[38] = 0.33598213147817668000;
  y[39] = 0.39247107881010240000;
  y[40] = 0.45121718317830301000;
  y[41] = 0.51267008667516623000;
  y[42] = 0.57735026918962618000;
  y[43] = 0.64586847728552887000;
  y[44] = 0.71895103828786022000;
  y[45] = 0.79747338888240393000;
  y[46] = 0.88250523616465459000;
  y[47] = 0.97537247158200291000;
  y[48] = 1.07774368351222670000;
  y[49] = 1.19175359259420950000;
  y[50] = 1.32018331365488510000;
  y[51] = 1.46673061342097320000;
  y[52] = 1.63642745273401610000;
  y[53] = 1.83630792973623190000;
  y[54] = 2.07652139657233640000;
  y[55] = 2.37228029184788890000;
  y[56] = 2.74747741945462160000;
  y[57] = 3.24192037576928450000;
  y[58] = 3.92724714760272690000;
  y[59] = 4.94671494494940060000;
  y[60] = 6.63456649978930190000;
  y[61] = 9.99349498241742220000;
  y[62] = 20.03689788997819200000;
  y[63] = 16331239353195370.00000000000000000000;
  

  for (int i = 0; i < vnum; i++) {
    Expect.approxEquals(y[i], Math.tan(x[i]), (y[i]/1e7).abs());
  }
}

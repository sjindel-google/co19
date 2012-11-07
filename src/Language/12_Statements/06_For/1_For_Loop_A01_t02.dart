/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a for statement of the form for (var v = e' ; c; e) s 
 * proceeds as follows:
 * If c is empty then let c' be true otherwise let c' be c.
 * First the variable declaration statement var v = e' is executed. Then:
 * 
 * 1. If this is the first iteration of the for loop, let v' be v. Otherwise, let v' be
 *    the variable v'' created in the previous execution of step 4.
 * 2. The expression [v'/v]c is evaluated and subjected to boolean conversion.
 *    If the result is false, the for loop completes. Otherwise, execution
 *    continues at step 3.
 * 3. The statement [v'/v]s is executed.
 * 4. Let v'' be a fresh variable. v'' is bound to the value of v'.
 * 5. The expression [v''/v]e is evaluated, and the process recurses at step 1.
 * @description Checks that if c is not empty then it is evaluated every iteration using
 * the current value of iteration variable. 
 * @author iefremov
 * @reviewer rodionov
 */


var log = "";
f(int i) {
  log = '$log$i';
  return i != 10;
}

main() {
  for(var i = 0; f(i); i++) ;
  Expect.equals("012345678910", log);
}
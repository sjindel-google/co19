/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a formal parameter bound [B]
 * contains a type [T] on the form qualified and [T] denotes a generic class [G]
 * (that is, [T] is a raw type), unless every formal type parameter of [G] has a
 * simple bound.
 * In short, type arguments on bounds can only be omitted if they themselves
 * have simple bounds. In particular, class [C<X extends C> {}] is a
 * compile-time error because the bound [C] is raw, and the formal type
 * parameter [X] that corresponds to the omitted type argument does not have a
 * simple bound.
 * @description Checks that declaration of the class with not simple-bounded
 * type argument causes compile error
 * @author iarkh@unipro.ru
 * @compile-error
 * @Issue 33184
 */

class D<T extends Comparable<T>> {}

// Error: T of D does not have a simple bound, so raw D cannot be a bound.
class E<T extends D> {}

main() {}
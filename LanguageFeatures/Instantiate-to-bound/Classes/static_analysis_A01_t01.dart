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
 * @description Checks that simple-bounded types can be a bound
 * @author iarkh@unipro.ru
 */

class A<T extends int> {}

// The raw type A is completed to A<int>.
A a;

// T of A has a simple bound, so A can be a bound and is completed to A<int>.
class B<T extends A> {}

class C<T extends int, S extends A<T>> {}

// The raw type C is completed to C<int, A<int>>.
C c;

class D<T extends Comparable<T>> {}
// The raw type D is completed to D<Comparable<dynamic>>.
D d;

class E<T extends int, T1 extends T, T2 extends T1> {}
E e;

main() {}

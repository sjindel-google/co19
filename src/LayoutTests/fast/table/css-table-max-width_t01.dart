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

const String htmlEL1 = r'''
<style type="text/css">
.parent
{
    width:300px;
    border:1px solid green;
}

.parent .child
{
    background-color:#999999;
    border:1px solid yellow;
}
</style>
''';

const String htmlEL2 = r'''
<div id="container" class="parent">
    <div id="maxGreatThanMinWidthAutoLayout" class="child" style="display:table; min-width:100px; max-width:200px; width:100%;">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod 
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
        fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa 
        qui officia deserunt mollit anim id est laborum.
    </div>
    <div id="minGreatThanMaxWidthAutoLayout" class="child" style="display:table; min-width:200px; max-width:100px; width:100%;">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod 
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
        fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa 
        qui officia deserunt mollit anim id est laborum.
    </div>
    <div id="onlyMaxWidthAutoLayout" class="child" style="display:table; max-width:200px; width:100%;">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod 
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
        fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa 
        qui officia deserunt mollit anim id est laborum.
    </div>
    <div id="maxWidthZeroAutoLayout" class="child" style="display:table; max-width:0; width:100%; font: 10px/1 Ahem;">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod 
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
        fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa 
        qui officia deserunt mollit anim id est laborum.
    </div>
        <div id="maxGreatThanMinWidthFixedLayout" class="child" style="display:table; table-layout:fixed; min-width:100px; max-width:200px; width:100%;">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod 
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
        fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa 
        qui officia deserunt mollit anim id est laborum.
    </div>
    <div id="minGreatThanMaxWidthFixedLayout" class="child" style="display:table; table-layout:fixed; min-width:200px; max-width:100px; width:100%;">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod 
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
        fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa 
        qui officia deserunt mollit anim id est laborum.
    </div>
    <div id="onlyMaxWidthFixedLayout" class="child" style="display:table; table-layout:fixed; max-width:200px; width:100%;">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod 
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
        fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa 
        qui officia deserunt mollit anim id est laborum.
    </div>
    <div id="maxWidthZeroFixedLayout" class="child" style="display:table; table-layout:fixed; max-width:0; width:100%;">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod 
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
        fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa 
        qui officia deserunt mollit anim id est laborum.
    </div>
</div>
''';

void main() {
    description('''Test case for bug <a href="http://webkit.org/b/98455">http://webkit.org/b/98455</a>. The testcase checks
if the max-width property overrides the computed width of a html container with display:table.<br>
A html container with display:table should not exceed the max-width even if its calculated
width is greater than the max-width value.<br>However when min-width property is set and its value is greated than
the max-width value, the width of the container must be equal to the min-width value.''');
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    
// 'Note:The width of the css tables inclusive of its border width.
    
    var maxGreatThanMinWidthAutoLayout = document.getElementById("maxGreatThanMinWidthAutoLayout");
    shouldBe(maxGreatThanMinWidthAutoLayout.getBoundingClientRect().width, 202);
    
    var minGreatThanMaxWidthAutoLayout = document.getElementById("minGreatThanMaxWidthAutoLayout");
    shouldBe(minGreatThanMaxWidthAutoLayout.getBoundingClientRect().width, 202);
    
    var onlyMaxWidthAutoLayout = document.getElementById("onlyMaxWidthAutoLayout");
    shouldBe(onlyMaxWidthAutoLayout.getBoundingClientRect().width, 202);
    
    var maxWidthZeroAutoLayout = document.getElementById("maxWidthZeroAutoLayout");
    shouldBe(maxWidthZeroAutoLayout.getBoundingClientRect().width, 182);
    
    var maxGreatThanMinWidthFixedLayout = document.getElementById("maxGreatThanMinWidthFixedLayout");
    shouldBe(maxGreatThanMinWidthFixedLayout.getBoundingClientRect().width, 202);
    
    var minGreatThanMaxWidthFixedLayout = document.getElementById("minGreatThanMaxWidthFixedLayout");
    shouldBe(minGreatThanMaxWidthFixedLayout.getBoundingClientRect().width, 202);
    
    var onlyMaxWidthFixedLayout = document.getElementById("onlyMaxWidthFixedLayout");
    shouldBe(onlyMaxWidthFixedLayout.getBoundingClientRect().width, 202);
    
    var maxWidthZeroFixedLayout = document.getElementById("maxWidthZeroFixedLayout");
    shouldBe(maxWidthZeroFixedLayout.getBoundingClientRect().width, 2);
        
    checkTestFailures();
}
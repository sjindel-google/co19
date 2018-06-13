/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/***
 * Generator for subtyping tests
 */
import "dart:io";

String TEST_CASES_DIR = ".." + Platform.pathSeparator + "test_cases";
String TEST_TYPES_DIR = ".." + Platform.pathSeparator + "test_types";
String OUTPUT_DIR = ".." + Platform.pathSeparator + "generated";

const String REPL_PREXIX = "//#";

main() {
  Directory testCasesDir = new Directory(TEST_CASES_DIR);
  Directory testTypesDir = new Directory(TEST_TYPES_DIR);
  Directory outputDir = new Directory(OUTPUT_DIR);

  // First, clear output directory
  List<FileSystemEntity> existing = outputDir.listSync();
  for (int i = 0; i < existing.length; i++) {
    existing[i].deleteSync();
  }

  // Generate tests
  List<FileSystemEntity> testCases = testCasesDir.listSync();
  List<FileSystemEntity> testTypes = testTypesDir.listSync();

  int generatedCount = 0;
  for (int i = 0; i < testTypes.length; i++) {
    File testType = testTypes[i];
    bool isFailTest = isFail(testType);
    String testTypeText = testType.readAsStringSync();
    Map<String, String> replacement = null;
    try {
      replacement = findReplacements(testTypeText);
    } on Exception catch (e) {
      throw new Exception(
          "Error processing file ${testType.path}: ${e.toString()}");
    }
    if (replacement.length == 0) {
      continue;
    }
    for (int j = 0; j < testCases.length; j++) {
      File testCase = testCases[j];
      if (isFailTest) {
        if (!isFail(testCase)) {
          continue;
        }
      } else {
        if (isFail(testCase)) {
          continue;
        }
      }
      String testCaseText = testCase.readAsStringSync();
      testCaseText = removeHeader(testCaseText);
      testCaseText = replace(testCaseText, replacement);
      String generatedTestText =
          removeReplacements(testTypeText) + testCaseText;
      File generatedTest = getGeneratedTestFile(testType, testCase);
      generatedTest.writeAsStringSync(generatedTestText);
      generatedCount++;
    }
  }
  print("$generatedCount tests generated successfully");
}

Map<String, String> findReplacements(String text) {
  Map<String, String> found = new Map<String, String>();
  List<String> strings = text.split("\n");
  for (int i = 0; i < strings.length; i++) {
    if (strings[i].startsWith(REPL_PREXIX)) {
      String s = strings[i].substring(REPL_PREXIX.length);
      List<String> l = s.split("=");
      if (l.length != 2) {
        throw Exception("Wrong replacement pattern '${strings[i]}'");
      }
      String key = l[0].trim();
      String value = l[1].trim();
      found[key] = value;
    }
  }
  return found;
}

String removeHeader(String text) {
  // If file begins with /* - remove this comment
  int start = text.indexOf("/*");
  int end = text.indexOf("*/");
  if (start > -1 && end > -1) {
    text = text.replaceRange(start, end + 2, "");
    // If there is one more comment - remove it as well
    start = text.indexOf("/*");
    end = text.indexOf("*/");
    if (start > -1 && end > -1) {
      text = text.replaceRange(start, end + 2, "");
    }
  }
  return text;
}

String removeReplacements(String text) {
  List<String> strings = text.split("\n");
  List<String> found = [];
  for (int i = 0; i < strings.length; i++) {
    if (strings[i].startsWith(REPL_PREXIX)) {
      found.add(strings[i]);
    }
  }
  found.forEach((String el) {
    strings.remove(el);
  });
  StringBuffer sb = new StringBuffer();
  sb.writeAll(strings, "\n");
  return sb.toString();
}

String replace(String text, Map<String, String> replacement) {
  replacement.keys.toList().forEach((String Ti) {
    text = text.replaceAll(Ti, replacement[Ti]);
  });
  return text;
}

File getGeneratedTestFile(File testType, File testCase) {
  String testTypeName = getFileName(testType);
  String testCaseName = getFileName(testCase);
  // testTypeName file name looks like interface_compositionality_A01.dart
  // prefix = interface_compositionality, suffix = _A01
  int index = testTypeName.lastIndexOf("_");
  String testNamePrefix = testTypeName.substring(0, index);
  String testNameSuffix = testTypeName.substring(index, index + 4);

  // testCaseName file name looks like arguments_binding_x01.dart
  // prefix = arguments_binding, suffix = _x01.dart
  index = testCaseName.lastIndexOf("_");
  String testCasePrefix = testCaseName.substring(0, index);
  String testCaseSuffix = testCaseName.substring(index).replaceFirst("x", "t");

  String generatedTestName = testNamePrefix + "_" + testCasePrefix +
      testNameSuffix + testCaseSuffix;
  File generatedFile = new File(OUTPUT_DIR + Platform.pathSeparator + generatedTestName);
  generatedFile.createSync();
  return generatedFile;
}

String getFileName(File file) =>
    file.path.substring(file.path.lastIndexOf(Platform.pathSeparator) + 1);

bool isFail(File file) => getFileName(file).contains("_fail_");

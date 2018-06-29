/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/***
 * Generator for subtyping tests
 */
import "dart:io";

const GENERIC_FUNCTION_TYPE_FLAG = "@GenericFunctionType";
const DYNAMIC_TESTS_DIR = "dynamic";
const STATIC_TESTS_DIR = "static";
const TEST_CASES_DIR = "test_cases";
const TEST_TYPES_DIR = "test_types";
const OUTPUT_DIR = "generated";

const IMPORT_COMMON = "import '../../utils/common.dart';";
const IMPORT_EXPECT = "import '../../../../Utils/expect.dart';";

const String META_PREXIX = "//#";

main() {
  Directory testCasesDir = new Directory(".." + Platform.pathSeparator +
      DYNAMIC_TESTS_DIR + Platform.pathSeparator + TEST_CASES_DIR);
  Directory testTypesDir = new Directory(".." + Platform.pathSeparator +
      TEST_TYPES_DIR);
  Directory outputDir = new Directory(".." + Platform.pathSeparator +
      DYNAMIC_TESTS_DIR + Platform.pathSeparator + OUTPUT_DIR);
  generateTests(testCasesDir, testTypesDir, outputDir, "dynamic");

  testCasesDir = new Directory(".." + Platform.pathSeparator +
      STATIC_TESTS_DIR + Platform.pathSeparator + TEST_CASES_DIR);
  testTypesDir = new Directory(".." + Platform.pathSeparator +
      TEST_TYPES_DIR);
  outputDir = new Directory(".." + Platform.pathSeparator +
      STATIC_TESTS_DIR + Platform.pathSeparator + OUTPUT_DIR);
  generateTests(testCasesDir, testTypesDir, outputDir, "static");
}

void generateTests(Directory testCasesDir, Directory testTypesDir,
    Directory outputDir, String testsType) {
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
    List<String> testTypeTextStrings = testTypeText.split("\n");
    Map<String, String> replacement = null;
    bool isGenericFunctionType = findIsGenericFunctionType(testTypeTextStrings);
    replacement = findReplacements(testTypeTextStrings);
    if (replacement.length == 0) {
      continue;
    }
    testTypeTextStrings = addImport(testTypeTextStrings, isFailTest);
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
      testCaseText = removeNotGenericFunctionTypePart(isGenericFunctionType, testCaseText);
      testCaseText = replace(testCaseText, replacement);
      String generatedTestText =
          removeReplacements(testTypeTextStrings) + testCaseText;
      File generatedTest = getGeneratedTestFile(testType, testCase, outputDir);
      generatedTest.writeAsStringSync(generatedTestText);
      generatedCount++;
    }
  }
  print("$generatedCount $testsType tests generated successfully");
}

bool findIsGenericFunctionType(List<String> strings) {
  for (int i = 0; i < strings.length; i++) {
    if (strings[i].startsWith(META_PREXIX)) {
      String s = strings[i].substring(META_PREXIX.length).trim();
      if (s == GENERIC_FUNCTION_TYPE_FLAG) {
        return true;
      }
    }
  }
  return false;
}

Map<String, String> findReplacements(List<String> strings) {
  Map<String, String> found = new Map<String, String>();
  for (int i = 0; i < strings.length; i++) {
    if (strings[i].startsWith(META_PREXIX)) {
      String s = strings[i].substring(META_PREXIX.length).trim();
      List<String> l = s.split("=");
      if (l.length != 2) {
        continue;
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

String removeReplacements(List<String> strings) {
  List<String> found = [];
  for (int i = 0; i < strings.length; i++) {
    if (strings[i].startsWith(META_PREXIX)) {
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

String removeNotGenericFunctionTypePart(bool isGenericFunctionType, String text) {
  if (isGenericFunctionType) {
    List<String> strings = text.split("\n");
    bool skip = false;
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < strings.length; i++) {
      if (strings[i].trim().startsWith(META_PREXIX)) {
        if (skip) {
          if (strings[i].contains("-->")) {
            skip = false;
            continue;
          } else {
            throw new Exception("Unexpected '${strings[i]}'");
          }
        } else {
          if (strings[i].contains(new RegExp("<--\sNotGenericFunctionType"))) {
            skip = true;
            continue;
          }
        }
      } else {
        if (skip) {
          continue;
        } else {
          sb.write(strings[i] + "\n");
        }
      }
    }
    return sb.toString();
  } else {
    // remove "//# <-- NotGenericFunctionType" and "//# -->"
    return text.replaceFirst("$META_PREXIX <-- NotGenericFunctionType\n", "").replaceFirst("$META_PREXIX -->\n", "");
  }
}

String replace(String text, Map<String, String> replacement) {
  replacement.keys.toList().forEach((String Ti) {
    text = text.replaceAll(Ti, replacement[Ti]);
  });
  return text;
}

File getGeneratedTestFile(File testType, File testCase, Directory outputDir) {
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
  File generatedFile = new File(outputDir.path + Platform.pathSeparator + generatedTestName);
  generatedFile.createSync();
  return generatedFile;
}

String getFileName(File file) =>
    file.path.substring(file.path.lastIndexOf(Platform.pathSeparator) + 1);

bool isFail(File file) => getFileName(file).contains("_fail_");

List<String> addImport(List<String> testTypeTextStrings, bool addExpect) {
  int counter = 0;
  for (int i = 0; i < testTypeTextStrings.length; i++) {
    if (testTypeTextStrings[i].contains("*/")) {
      counter++;
    }
    if (counter == 2) {
      if (addExpect) {
        testTypeTextStrings.insert(i + 1, IMPORT_EXPECT);
      }
      testTypeTextStrings.insert(i + 1, IMPORT_COMMON);
      break;
    }
  }
  return testTypeTextStrings;
}

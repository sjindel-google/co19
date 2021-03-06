/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<Process> start(
 *     String executable,
 *     List<String> arguments, {
 *     String workingDirectory,
 *     Map<String, String> environment,
 *     bool includeParentEnvironment: true,
 *     bool runInShell: false,
 *     ProcessStartMode mode: ProcessStartMode.normal
 * })
 * ...
 * Use environment to set the environment variables for the process. If not set
 * the environment of the parent process is inherited. Currently, only US-ASCII
 * environment variables are supported and errors are likely to occur if an
 * environment variable with code-points outside the US-ASCII range is passed
 * in.
 *
 * @description Checks that if environment is not set the environment of the
 * parent process is inherited.
 * @author ngl@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  String envString = Platform.environment.toString();
  String executable = Platform.resolvedExecutable;
  String file = Platform.script.toFilePath(windows: Platform.isWindows);
  int index = file.indexOf("start_A02_t02.dart");
  String ePath = file.substring(0, index);
  String eFile = ePath + "checkEnvironment_lib.dart";

  asyncStart();
  Process.start(executable, [eFile]).then((Process process) {
    process.stdout.toList().then((List outList) {
      Utf8Decoder decoder = new Utf8Decoder();
      String decoded = decoder.convert(outList[0]);
      Expect.isTrue(decoded.contains(envString));
    }).then((_) {
      process.stderr.toList().then((List errList) {
        Expect.equals(0, errList.length);
        asyncEnd();
      });
    });
  });
}

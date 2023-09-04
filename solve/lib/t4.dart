library solve_jh;

import 'package:lib/study_lib.dart';

class T4 extends ITextTest {
  List<String> args = [];

  @override
  String get authorName => 'jh';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    final output = <String>[];
    final sb = StringBuffer();

    args.sort((a, b) => a.compareTo(b));
    args.sort((a, b) => a.length.compareTo(b.length));
    final myList = args.map((e) => e.length.toString() + e).toList();

    for (var l in myList) {
      sb.write('$l\n');
    }

    output.add(sb.toString());

    return output;
  }

  @override
  void setInput(List<String> args) {
    this.args = args;
  }
}

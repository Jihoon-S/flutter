library solve_jh;

import 'package:lib/study_lib.dart';

class T0 extends ITextTest {
  List<String> args = [];

  @override
  String get authorName => 'Jihoon';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    if (args.isEmpty) {
      return [''];
    }

    final output = <String>[];

    for (final arg in args) {
      output.add(write(arg));
    }

    return output;
  }

  @override
  void setInput(List<String> args) {
    this.args = args;
  }

  String write(String s) {
    var num = int.parse(s);
    var buffer = StringBuffer();
    for (var i = 1; i <= 9; i++) {
      var multiple = num * i;
      buffer.write('$num * $i = $multiple');
      buffer.write('\n');
    }
    return buffer.toString();
  }
}

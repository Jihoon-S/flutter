library solve_jh;

import 'package:lib/study_lib.dart';
export 'package:solve_jh/t1.dart' show T1;

class T1 extends ITextTest {
  List<String> args = [];

  @override
  String get authorName => 'Jihoon';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    throw UnimplementedError();
  }

  @override
  void setInput(List<String> args) {
    this.args = args;
  }
}

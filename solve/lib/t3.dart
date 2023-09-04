library solve_jh;

import 'dart:math';

import 'package:lib/study_lib.dart';

class T3 extends ITextTest {
  List<String> args = [];
  bool isRight = true;
  double x = 0;
  double y = 0;
  double degree = 0.0;

  @override
  String get authorName => 'Jihoon';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    try {
      final output = <String>[];
      final sb = StringBuffer();

      for (var i = 0; i < 20; i++) {
        for (var j = 0; j < 40; j++) {
          if (i == y.round() && j == x.round()) {
            sb.write('k');
          } else {
            sb.write('_');
          }
        }
        sb.write('\n');
      }
      output.add(sb.toString());

      degree += 360 * delta.inMilliseconds / 1500;
      y = 10 + (10 * sin(degree * (pi / 180.0)));

      if (isRight) {
        x += 40 * delta.inMilliseconds / 1500;
        if (x > 38) isRight = !isRight;
      } else {
        x -= 40 * delta.inMilliseconds / 1500;
        if (x < 1) isRight = !isRight;
      }

      return output;
    } catch (e) {
      return [e.toString()];
    }
  }

  @override
  void setInput(List<String> args) {
    this.args = args;
  }
}

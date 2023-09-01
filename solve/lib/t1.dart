library solve_jh;

import 'package:lib/study_lib.dart';

class T1 extends ITextTest {
  final List<int> nx = [5, 0, -5, 0];
  final List<int> ny = [0, -5, 0, 5];
  List<String> args = [];
  List<String> lastOutput = [];
  DateTime lastDelta = DateTime.now();
  int x = 18;
  int y = 12;
  int idx = 0;

  @override
  String get authorName => 'Jihoon';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    List<String> output = <String>[];

    try {
      final nowDelta = DateTime.now();
      final diff = nowDelta.difference(lastDelta).inMilliseconds;

      if (diff > 300 || idx < 1) {
        lastDelta = nowDelta;
        final coordinates = List.filled(20, List.filled(40, 0));
        final animationBuffer = StringBuffer();
        for (var i = 0; i < coordinates.length; i++) {
          for (var j = 0; j < coordinates[i].length; j++) {
            [y, y + 1, y - 1].contains(i) && [x, x + 1, x - 1].contains(j)
                ? animationBuffer.write('♥')
                : animationBuffer.write('♡');
          }
          animationBuffer.write('\n');
        }
        x += nx[idx % 4];
        y += ny[idx % 4];
        idx++;

        final stringBuffer = StringBuffer();
        for (var i = 1; i <= 21; i++) {
          stringBuffer.write('♥' * i);
          stringBuffer.write('\n');
        }

        output.add(stringBuffer.toString());
        output.add(animationBuffer.toString());
        lastOutput = output;

        return output;
      }
      return lastOutput;
    } catch (e) {
      return [e.toString()];
    }
  }

  @override
  void setInput(List<String> args) {
    this.args = args;
  }
}

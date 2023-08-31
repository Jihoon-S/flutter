library solve_jh;

import 'package:lib/study_lib.dart';

class T1 extends ITextTest {
  List<String> args = [];
  var x = 18;
  var y = 12;
  var nx = [5, 0, -5, 0];
  var ny = [0, -5, 0, 5];
  var idx = 0;

  @override
  String get authorName => 'Jihoon';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    try {
      final output = <String>[];
      var coordinates = List.filled(20, List.filled(40, 0));
      var animationBuffer = StringBuffer();
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

      var stringBuffer = StringBuffer();
      for (var i = 1; i <= 21; i++) {
        idx % i != 0
            ? stringBuffer.write('♥' * i)
            : stringBuffer.write('♡' * i);
        stringBuffer.write('\n');
      }

      output.add(stringBuffer.toString());
      output.add(animationBuffer.toString());
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

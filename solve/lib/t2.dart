library solve_jh;

import 'package:lib/study_lib.dart';

class T2 extends ITextTest {
  List<String> args = [];
  bool isDown = true;
  double y = 0;
  Duration lastTop = Duration.zero;

  @override
  String get authorName => 'Jihoon';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    try {
      final output = <String>[];
      final sb = StringBuffer();

      for (var i = 0; i < 20; i++) {
        if (i == y.round()) {
          sb.write('□' * 19);
          sb.write('■' * 2);
          sb.write('□' * 19);
        } else {
          sb.write('□' * 40);
        }
        sb.write('\n');
      }

      if (y < 1) {
        lastTop = elapsed;
      }
      output.add(lastTop.toString());
      output.add(sb.toString());

      if (isDown) {
        y += 40 * delta.inMilliseconds / 1000;
        if (y > 18) isDown = !isDown;
      } else {
        y -= 40 * delta.inMilliseconds / 1000;
        if (y < 1) isDown = !isDown;
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

library solve_jh;

import 'package:lib/study_lib.dart';

class T1 extends ITextTest {
  List<String> args = [];

  @override
  String get authorName => 'Jihoon';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    try {
      final output = <String>[];
      // var coordinates = List.filled(20, ['-' * 40]);

      var buffer = StringBuffer();
      // for (var i = 0; i < coordinates.length; i++) {
      //   for (var j = 0; j < coordinates[0].length; j++) {
      //     buffer.write(coordinates[i][j]);
      //     buffer.write('\n');
      //   }
      // }
      for (var i = 1; i <= 20; i++) {
        buffer.write('♥' * i);
        buffer.write('\n');
      }

      output.add(buffer.toString());

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

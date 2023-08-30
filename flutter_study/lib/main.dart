import 'dart:convert';

void main() {
  const jsonData = '{"name": "Pizza da Mario", "cuisine": "Italian"}';
  var t0 = T0();
  t0.setInput([jsonData]);
  print(t0.getOutput(Duration.zero, Duration.zero));
}

abstract class ITextTest {
  String get authorName;
  List<String> getOutput(Duration elapsed, Duration delta);
  void setInput(List<String> args);
}

class T0 implements ITextTest {
  List<String> args = [];

  @override
  String get authorName => 'jihoon';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    Map<String, dynamic> parsed = jsonDecode(args[0]);
    var name = parsed['name'];
    var cuisine = parsed['cuisine'];
    var message = 'Welcome to $cuisine restaurant $name !';

    return [
      'Elapsed: ${elapsed.inMilliseconds}ms',
      'Delta: ${delta.inMilliseconds}ms',
      message,
    ];
  }

  @override
  void setInput(List<String> args) {
    this.args = args;
  }
}

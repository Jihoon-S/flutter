void main() {
  var t1 = T1();
  t1.setInput(['test1', 'test2']);
  print(t1.getOutput(Duration.zero, Duration.zero));
}

abstract class ITextTest {
  String get authorName;
  List<String> getOutput(Duration elapsed, Duration delta);
  void setInput(List<String> args);
}

class T1 implements ITextTest {
  List<String> args = [];

  @override
  String get authorName => 'jihoon';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    return [
      'Elapsed: ${elapsed.inMilliseconds}ms',
      'Delta: ${delta.inMilliseconds}ms',
      ...args,
    ];
  }

  @override
  void setInput(List<String> args) {
    this.args = args;
  }
}

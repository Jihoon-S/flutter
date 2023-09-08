import 'package:flutter/material.dart';
import 'package:lib/study_lib.dart';

class W8 extends IWidgetTest {
  @override
  String get authorName => 'jh';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W8Widget(key: key);
  }
}

class W8Widget extends StatefulWidget {
  const W8Widget({super.key});

  @override
  State<W8Widget> createState() => _W8WidgetState();
}

class _W8WidgetState extends State<W8Widget> {
  final box1Key = GlobalKey<_Box1State>();
  final box2Key = GlobalKey<_Box2State>();
  final box3Key = GlobalKey<_Box3State>();
  final ValueNotifier<int> noti = ValueNotifier<int>(6);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Box1(key: box1Key),
        const SizedBox(
          width: 20,
        ),
        Box2(key: box2Key),
        const SizedBox(
          width: 20,
        ),
        Box3(key: box3Key),
      ],
    );
  }
}

class Box1 extends StatefulWidget {
  const Box1({Key? key}) : super(key: key);

  @override
  State<Box1> createState() => _Box1State();
}

class _Box1State extends State<Box1> {
  int val = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.orange,
      child: Center(
        child: Text('$val'),
      ),
    );
  }
}

class Box2 extends StatefulWidget {
  const Box2({Key? key}) : super(key: key);

  @override
  State<Box2> createState() => _Box2State();
}

class _Box2State extends State<Box2> {
  int val = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.red,
      child: Center(
        child: Text('$val'),
      ),
    );
  }
}

class Box3 extends StatefulWidget {
  const Box3({Key? key}) : super(key: key);

  @override
  State<Box3> createState() => _Box3State();
}

class _Box3State extends State<Box3> {
  int val = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.purple,
      child: Center(
        child: Text('$val'),
      ),
    );
  }
}

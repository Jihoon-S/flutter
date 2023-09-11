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

  void onTap() {
    final values = [
      box1Key.currentState!.noti.value,
      box2Key.currentState!.noti.value,
      box3Key.currentState!.noti.value,
    ];
    values.sort();

    final targetValue = box1Key.currentState!.noti.value +
        box2Key.currentState!.noti.value +
        box3Key.currentState!.noti.value;

    if (box1Key.currentState!.noti.value == values[0]) {
      box1Key.currentState!.noti.value = targetValue;
    } else if (box2Key.currentState!.noti.value == values[0]) {
      box2Key.currentState!.noti.value = targetValue;
    } else {
      box3Key.currentState!.noti.value = targetValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Box1(key: box1Key),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: onTap,
          child: Box2(key: box2Key),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: onTap,
          child: Box3(key: box3Key),
        ),
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
  final ValueNotifier<int> noti = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.orange,
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: noti,
          builder: ((context, value, child) {
            return Text(
              '$value',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            );
          }),
        ),
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
  final ValueNotifier<int> noti = ValueNotifier<int>(2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.red,
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: noti,
          builder: ((context, value, child) {
            return Text(
              '$value',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            );
          }),
        ),
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
  final ValueNotifier<int> noti = ValueNotifier<int>(3);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.purple,
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: noti,
          builder: ((context, value, child) {
            return Text(
              '$value',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            );
          }),
        ),
      ),
    );
  }
}

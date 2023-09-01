library solve_jh;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lib/study_lib.dart';

class W1 extends IWidgetTest {
  @override
  String get authorName => 'Jihoon';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W1Widget(key: key);
  }
}

class W1Widget extends StatefulWidget {
  const W1Widget({super.key});

  @override
  State<W1Widget> createState() => _W1WidgetState();
}

class _W1WidgetState extends State<W1Widget> {
  Color myColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 50,
        decoration: BoxDecoration(
          color: myColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              myColor =
                  Colors.primaries[Random().nextInt(Colors.primaries.length)];
            });
          },
        ),
      ),
    );
  }
}

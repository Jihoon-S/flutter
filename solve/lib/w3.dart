library solve_jh;

import 'package:flutter/material.dart';
import 'package:lib/study_lib.dart';

class W3 extends IWidgetTest {
  @override
  String get authorName => 'jh';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W3Widget(key: key);
  }
}

class W3Widget extends StatefulWidget {
  const W3Widget({super.key});

  @override
  State<W3Widget> createState() => _W3WidgetState();
}

class _W3WidgetState extends State<W3Widget> {
  double progress = 0.0;

  void onChanged(double value) {
    setState(() {
      progress = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.5 - 20,
          left: MediaQuery.of(context).size.width * 0.5 - 150,
          width: 300,
          height: 40,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.5 - 20,
          left: MediaQuery.of(context).size.width * 0.5 - 150,
          width: (300 * progress).toDouble(),
          height: 40,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: progress > 0.99
                  ? BorderRadius.circular(15)
                  : const BorderRadius.horizontal(left: Radius.circular(15)),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.5 - 20,
          left: MediaQuery.of(context).size.width * 0.5 - 150,
          width: 300,
          height: 40,
          child: Center(
            child: Text('${(progress * 100).round()}%'),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.5 + 20,
          left: MediaQuery.of(context).size.width * 0.5 - 150,
          width: 300,
          child: Slider(
            value: progress,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

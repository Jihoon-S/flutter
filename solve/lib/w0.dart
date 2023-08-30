library solve_jh;

import 'package:flutter/material.dart';
import 'package:lib/study_lib.dart';

class W0 implements IWidgetTest {
  @override
  String get authorName => 'Jihoon';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W0Widget(key: key);
  }
}

class W0Widget extends StatefulWidget {
  const W0Widget({super.key});

  @override
  State<W0Widget> createState() => _W0WidgetState();
}

class _W0WidgetState extends State<W0Widget> {
  Duration elapsed = Duration.zero;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Fun Flutter! Yay!'),
      ),
    );
  }
}

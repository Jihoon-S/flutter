library solve_jh;

import 'package:flutter/material.dart';
import 'package:lib/study_lib.dart';

class W7 extends IWidgetTest {
  @override
  String get authorName => 'jh';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W7Widget(key: key);
  }
}

class W7Widget extends StatefulWidget {
  const W7Widget({super.key});

  @override
  State<W7Widget> createState() => _W7WidgetState();
}

class _W7WidgetState extends State<W7Widget> implements ITickerState {
  double stop = 0.0;

  @override
  void onTick(Duration elapsed, Duration delta) {
    stop += 1.0 * (delta.inMilliseconds / 1000);

    if (stop > 0.99) stop = 0.0;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(
          radius: 0.35,
          colors: const [
            Colors.red,
            Colors.yellow,
          ],
          stops: [0.0, stop],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'KEEP CALM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'AND',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'DON\'T FEED THE TROLL',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

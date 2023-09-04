library solve_jh;

import 'package:flutter/material.dart';
import 'package:lib/study_lib.dart';

class W4 extends IWidgetTest {
  @override
  String get authorName => 'jh';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W4Widget(key: key);
  }
}

class W4Widget extends StatefulWidget {
  const W4Widget({super.key});

  @override
  State<W4Widget> createState() => _W4WidgetState();
}

class _W4WidgetState extends State<W4Widget> {
  static const String catUrl =
      'https://cdn.aitimes.kr/news/photo/202303/27617_41603_044.jpg';
  static const String dogUrl =
      'https://png.pngtree.com/illustration/20230418/ourmid/pngtree-an-image-of-a-cute-puppy-on-cloud-image_162728.png';
  String src = catUrl;

  void onPressed() {
    setState(() {
      src == catUrl ? src = dogUrl : src = catUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Image.network(
              src,
              key: ValueKey<String>(src),
              width: 300,
              height: 300,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text('교체'),
          ),
        ],
      ),
    );
  }
}

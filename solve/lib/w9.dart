import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lib/study_lib.dart';

class W9 extends IWidgetTest {
  @override
  String get authorName => 'jh';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W9Widget(key: key);
  }
}

class W9Widget extends StatefulWidget {
  const W9Widget({super.key});

  @override
  State<W9Widget> createState() => _W9WidgetState();
}

class _W9WidgetState extends State<W9Widget> {
  Offset position = const Offset(25, 25);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: CheckerBoard(),
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  (AppBar().preferredSize.height +
                      const TabBar(tabs: []).preferredSize.height)),
        ),
        Positioned(
          left: position.dx,
          top: position.dy,
          child: Draggable(
            feedback: Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[300]!.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Dragging...',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            onDraggableCanceled: (_, offset) {
              setState(() {
                position = Offset(
                    offset.dx,
                    offset.dy -
                        (AppBar().preferredSize.height +
                            const TabBar(tabs: []).preferredSize.height));
              });
            },
            childWhenDragging: Container(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red[300]!.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'Hello World!',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CheckerBoard extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) async {
    const squareSize = 50.0;
    final rows = (size.height / squareSize).round();
    final cols = (size.width / squareSize).round();

    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < cols; j++) {
        if ((i + j) % 2 == 0) {
          canvas.drawRect(
            Offset(j * squareSize, i * squareSize) &
                const Size(squareSize, squareSize),
            Paint()..color = Colors.black54,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

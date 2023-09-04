library solve_jh;

import 'package:flutter/material.dart';
import 'package:lib/study_lib.dart';

class W2 extends IWidgetTest {
  @override
  String get authorName => 'Jihoon';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W2Widget(key: key);
  }
}

class W2Widget extends StatefulWidget {
  const W2Widget({super.key});

  @override
  State<W2Widget> createState() => _W2WidgetState();
}

class _W2WidgetState extends State<W2Widget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 100,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_box_outlined,
              size: 60,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '댕댕이',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[700],
                    ),
                  ),
                  const Text(
                    '댕댕이도 귀여워',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

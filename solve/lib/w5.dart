library solve_jh;

import 'package:flutter/material.dart';
import 'package:lib/study_lib.dart';

class W5 extends IWidgetTest {
  @override
  String get authorName => 'jh';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W5Widget(key: key);
  }
}

class W5Widget extends StatefulWidget {
  const W5Widget({super.key});

  @override
  State<W5Widget> createState() => _W5WidgetState();
}

class _W5WidgetState extends State<W5Widget> {
  final List<Color> colorList = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.deepPurple
  ];

  final List<String> daysList = [
    '월',
    '화',
    '수',
    '목',
    '금',
    '토',
    '일',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        itemCount: 7,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // fullscreenDialog: true,
                    builder: (context) => DetailW5Widget(
                      index: index,
                      colorList: colorList,
                      daysList: daysList,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: index,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorList[index],
                        colorList[index + 1].withOpacity(0.7),
                      ],
                      stops: const [0.3, 1],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      daysList[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailW5Widget extends StatelessWidget {
  final int index;
  final List<Color> colorList;
  final List<String> daysList;

  const DetailW5Widget({
    super.key,
    required this.index,
    required this.colorList,
    required this.daysList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Test'),
      ),
      body: Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: index,
                child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: colorList[index],
                      borderRadius: BorderRadius.circular(999),
                      gradient: LinearGradient(
                        colors: [
                          colorList[index],
                          colorList[index + 1].withOpacity(0.7),
                        ],
                        stops: const [0.3, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        daysList[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Back',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

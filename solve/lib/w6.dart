library solve_jh;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lib/study_lib.dart';

class Marker {
  double x;
  double y;

  Marker(this.x, this.y);
}

class W6 extends IWidgetTest {
  @override
  String get authorName => 'jh';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return W6Widget(key: key);
  }
}

class W6Widget extends StatefulWidget {
  const W6Widget({super.key});

  @override
  State<W6Widget> createState() => _W6WidgetState();
}

class _W6WidgetState extends State<W6Widget> with TickerProviderStateMixin {
  bool isRotate = false;
  double x = 0.0;
  double z = 0.0;
  List<Marker> markers = [];
  final imageWidth = 300.0;
  final imageHeight = 300.0;

  late AnimationController _controllerX;
  late AnimationController _controllerZ;

  @override
  void initState() {
    _controllerX = AnimationController(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      vsync: this,
      upperBound: pi * 0.32,
    );
    _controllerX.addListener(() {
      setState(() {
        x = _controllerX.value * -1;
        if (isRotate) {
          updateMarkerPositions();
        }
      });
    });
    _controllerZ = AnimationController(
      duration: const Duration(milliseconds: 3000),
      reverseDuration: const Duration(milliseconds: 500),
      vsync: this,
      upperBound: pi * 2,
    );
    _controllerZ.addListener(() {
      setState(() {
        z = _controllerZ.value;
        if (isRotate) {
          updateMarkerPositions();
        }
      });
    });
    super.initState();
  }

  void updateMarkerPositions() {
    setState(() {});
  }

  @override
  void dispose() {
    _controllerX.dispose();
    _controllerZ.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTapDown: (TapDownDetails details) {
                  final markerX = details.localPosition.dx - 18.0;
                  final markerY = details.localPosition.dy - 36.0;

                  setState(() {
                    markers.add(Marker(markerX, markerY));
                  });
                },
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(x)
                    ..rotateZ(z),
                  alignment: Alignment.center,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(-10, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://cdn.aitimes.kr/news/photo/202303/27617_41603_044.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              for (var marker in markers)
                Positioned(
                  left: marker.x,
                  top: marker.y,
                  child: const Icon(
                    Icons.location_pin,
                    size: 36,
                    color: Colors.amber,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Slider(
            value: x,
            min: pi * -2,
            max: pi * 2,
            onChanged: (value) {
              setState(
                () {
                  x = value;
                  updateMarkerPositions();
                },
              );
            },
          ),
          Slider(
            value: z,
            min: pi * -2,
            max: pi * 2,
            onChanged: (value) {
              setState(
                () {
                  z = value;
                  updateMarkerPositions();
                },
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (markers.isNotEmpty)
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (isRotate) {
                        _controllerX.reverse();
                        _controllerZ.reverse();
                      } else {
                        _controllerX.forward();
                        _controllerZ.repeat();
                      }

                      isRotate = !isRotate;
                    });
                  },
                  child: Text(isRotate ? 'end' : 'Start'),
                ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _controllerX.reverse();
                    _controllerZ.reverse();
                    x = 0.0;
                    z = 0.0;
                    markers = [];
                    isRotate = false;
                  });
                },
                child: const Text('Reset'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

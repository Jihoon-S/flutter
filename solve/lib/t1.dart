library solve_jh;

import 'package:flutter/material.dart';
import 'package:lib/study_lib.dart';
import 'dart:async';

class T1 extends ITextTest {
  List<String> args = [];

  @override
  String get authorName => 'Jihoon';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    try {
      final output = <String>[];
      var coordinates = List.filled(20, List.filled(40, 0));
      var nx = [1, -1, 0, 0];
      var ny = [0, 0, 1, -1];

      Timer.periodic(const Duration(seconds: 1), (Timer t) {
        for (var y = 0; y < coordinates.length; y++) {
          for (var x = 0; x < coordinates[y].length; x++) {
            print(coordinates[y][x]);
            print('\n');
          }
        }
      });

      var buffer = StringBuffer();
      for (var i = 1; i <= 20; i++) {
        buffer.write('♥' * i);
        buffer.write('\n');
      }

      output.add(buffer.toString());
      return output;
    } catch (e) {
      return [e.toString()];
    }
  }

  @override
  void setInput(List<String> args) {
    this.args = args;
  }
}

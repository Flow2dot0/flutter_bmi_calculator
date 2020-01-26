import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  CalculatorBrain({@required this.weight, @required this.height});

  final int weight, height;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String displayStatus() {
    return _bmi >= 25.0 ? 'Overweight' : _bmi > 18.5 ? 'Normal' : 'Underweight';
  }

  String displayAdvice() {
    return _bmi >= 25.0
        ? 'You should follow a diet plan!'
        : _bmi > 18.5
            ? 'Everything is perfectly fine!'
            : 'You should eat a lot more!';
  }
}

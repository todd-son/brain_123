import 'dart:math';

import 'package:brain_123/rules/rule.dart';

class MaxMinSumRule with Rule {
  @override
  String description() {
    return "가장 큰 수와 작은 수를 더하세요.";
  }

  @override
  List<int> answer(List<int> quiz) {
    int maxVal = quiz.reduce(max);
    int minVal = quiz.reduce(min);
    int answer = maxVal + minVal;

    int first = answer ~/ 10;
    int second = answer % 10;

    if (first > 0)
      return [first, second];
    else
      return [second];
  }
}
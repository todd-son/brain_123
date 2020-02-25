import 'dart:math';

import 'package:brain_123/rules/rule.dart';

class MaxNextSumRule with Rule {
  @override
  String description() {
    return "가장 큰 수와 다음 큰 수를 더하세요.";
  }

  @override
  List<int> answer(List<int> quiz) {
    List<int> target = List();
    target.addAll(quiz);

    int maxVal = target.reduce(max);
    target.remove(maxVal);
    int nextVal = target.reduce(max);
    int answer = maxVal + nextVal;

    int first = answer ~/ 10;
    int second = answer % 10;

    if (first > 0)
      return [first, second];
    else
      return [second];
  }
}
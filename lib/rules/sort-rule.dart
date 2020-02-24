import 'package:brain_123/rules/rule.dart';
import 'package:flutter/foundation.dart';

class SortRule with Rule {
  @override
  String description() {
    return "숫자를 오름차순으로 입력하세요.";
  }

  @override
  bool satisfy(List<int> answers, List<int> values) {
    List<int> sorted = List();
    sorted.addAll(answers);
    sorted.sort((a, b) => a.compareTo(b));

    return listEquals(sorted, values);
  }
}
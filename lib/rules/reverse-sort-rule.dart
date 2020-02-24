import 'package:brain_123/rules/rule.dart';
import 'package:flutter/foundation.dart';

class ReverseSortRule with Rule {
  @override
  String description() {
    return "숫자를 내림차순으로 입력하세요.";
  }

  @override
  bool satisfy(List<int> answers, List<int> values) {
    List<int> sorted = List();
    sorted.addAll(answers);
    sorted.sort((b, a) => a.compareTo(b));

    return listEquals(sorted, values);
  }
}
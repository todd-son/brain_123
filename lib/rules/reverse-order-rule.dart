import 'package:brain_123/rules/rule.dart';
import 'package:flutter/foundation.dart';

class ReverseOrderRule with Rule {
  @override
  String description() {
    return "숫자를 역순으로 입력하세요.";
  }

  @override
  bool satisfy(List<int> answers, List<int> values) {
    return listEquals(answers.reversed.toList(), values);
  }
}
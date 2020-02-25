import 'package:brain_123/rules/rule.dart';
import 'package:flutter/foundation.dart';

class OrderRule with Rule {
  @override
  String description() {
    return "숫자를 순서대로 입력하세요.";
  }

  @override
  List<int> answer(List<int> quiz) {
    return quiz;
  }

}
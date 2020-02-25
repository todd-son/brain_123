import 'package:brain_123/rules/rule.dart';
import 'package:flutter/foundation.dart';

class ReverseSortRule with Rule {
  @override
  String description() {
    return "숫자를 내림차순으로 입력하세요.";
  }

  @override
  List<int> answer(List<int> quiz) {
    List<int> reversed = List();
    reversed.addAll(quiz);
    reversed.sort((b, a) => a.compareTo(b));
    return reversed;
  }
}
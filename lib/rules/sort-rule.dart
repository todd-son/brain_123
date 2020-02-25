import 'package:brain_123/rules/rule.dart';
import 'package:flutter/foundation.dart';

class SortRule with Rule {
  @override
  String description() {
    return "숫자를 오름차순으로 입력하세요.";
  }

  @override
  List<int> answer(List<int> quiz) {
    List<int> sorted = List();
    sorted.addAll(quiz);
    sorted.sort((a, b) => a.compareTo(b));
    return sorted;
  }
}
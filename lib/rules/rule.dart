mixin Rule {
  String description();

  bool satisfy(List<int> answers, List<int> values);
}
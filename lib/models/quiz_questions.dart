class QuizQuestions {
  const QuizQuestions(this.question, this.answer);
  final String question;
  final List<String> answer;

  List<String> getSuffledAnswers() {
    final suffledList = List.of(answer);
    suffledList.shuffle();
    return suffledList;
  }
}

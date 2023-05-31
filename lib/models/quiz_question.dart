class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList
        .shuffle(); // kopira listu u novu listu i onda shuffla iteme, jer bi inače shuffle promijenio redosljed elemenata u originalnoj listi
    return shuffledList;
  }
}

class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShaffleAnswer() {
    final shaffleAnswer = List.of(answers);

    shaffleAnswer.shuffle();
    return shaffleAnswer;
  }
}

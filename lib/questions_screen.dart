import 'package:flutter/material.dart';
import 'answer_button.dart';
import 'data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentquestionIndex = 0;

  void questionAnswer(String selectAnswer) {
    widget.onSelectAnswer(selectAnswer);

    setState(() {
      currentquestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final quizCurrentQuestion = questions[currentquestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quizCurrentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            ...quizCurrentQuestion.getShaffleAnswer().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  questionAnswer(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}

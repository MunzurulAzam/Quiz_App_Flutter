import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questionSummary.dart';
import 'package:quiz_app/quiz.dart';
import 'data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chooseAnswer, required this.onRestart});

  final List<String> chooseAnswer;
  final void Function () onRestart;

  List<Map<String, Object>> getChoosenAnswer() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'choosen_answer': chooseAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getChoosenAnswer();
    final totalNumberOfQuestion = questions.length;
    final totalCorrectAnswer = summaryData.where((data) {
      return data['choosen_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Yours answer is Correct $totalCorrectAnswer out of $totalNumberOfQuestion! ",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 221, 202, 242),
                )),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: getChoosenAnswer()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text("Refresh"),
            ),
          ],
        ),
      ),
    );
  }
}

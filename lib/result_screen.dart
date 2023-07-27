import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/question_summary.dart';

import 'data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chooseAnswer});

  final List <String> chooseAnswer;

  List<Map<String, Object>> getChoosenAnswer(){

    final List<Map<String, Object>> Summary = [];

    for(var i=0; i<chooseAnswer.length; i++){

      Summary.add({
        'question_index': i,
        'question': questions[i].answers,
        'correct_answer': questions[i].answers[0],
        'choosen_answer': chooseAnswer[i],
      });

    }

    return Summary;

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Yours answer is Correct 3 out of 6! "),
            const SizedBox(
              height: 30,
            ),

            QuestionSummary(summaryData:getChoosenAnswer()),

            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

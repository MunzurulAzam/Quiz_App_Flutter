import 'package:flutter/material.dart';
import 'package:quiz_app/questionSummaryTotal/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['choosen_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifire(
            isCorrect: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  itemData['choosen_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 227, 156, 218),
                  ),
                ),
                Text(
                  itemData['correct_answer'] as String,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 97, 191, 208)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

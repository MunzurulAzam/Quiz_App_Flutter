import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            Text(((data['question_index'] as int) + 1).toString()),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Text(data['question'] as String),
                const SizedBox(
                  height: 5,
                ),
                Text(data['correct_answer'] as String),
                Text(data['choosen_answer'] as String),
              ],
            )
          ],
        );
      }).toList(),
    );
  }
}

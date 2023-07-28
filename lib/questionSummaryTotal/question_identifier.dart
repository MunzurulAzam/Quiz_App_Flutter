import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class QuestionIdentifire extends StatelessWidget {
  const QuestionIdentifire(
      {super.key, required this.questionIndex, required this.isCorrect});

  final int questionIndex;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrect
              ? const Color.fromARGB(227, 230, 6, 222)
              : const Color.fromARGB(255, 4, 75, 187),
              borderRadius: BorderRadius.circular(100),
              ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

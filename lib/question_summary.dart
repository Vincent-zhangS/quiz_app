import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return Column(
      children: summaryData.map((data) {
        final isCorrect =
            data['user_answer'] == data['correct_answer']; // <-checks if the user's answer matches the correct one
        return Row(
          children: [
            Text(
              ((data['question_index'] as int) + 1).toString(),
              style: TextStyle( // <- adds styling for the numbers
                fontSize: 18, // <- makes the question number bigger
                color: isCorrect ? Colors.green : Colors.red, // <-makes correct answer green and red if wrong
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Text(
                  data['question'] as String,
                  style: const TextStyle(color: Colors.white), //<-makes question text white and more visible
                ),
                const SizedBox(height: 5),
                Text(
                  data['user_answer'] as String,
                  style: TextStyle(
                    color: isCorrect ? Colors.green : Colors.red, // <-colors the user's answer
                  ),
                ),
                Text(
                  data['correct_answer'] as String,
                  style: const TextStyle(color: Colors.green), // <-correct answer always green
                ),
              ],
            )
          ],
        );
      }).toList(),
    );
  }
}
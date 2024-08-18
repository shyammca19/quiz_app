import 'package:flutter/material.dart';
import 'package:demo_app2/data/quiz_data.dart';
import 'package:demo_app2/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summery = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summery.add({
        'question_index': i,
        'question': quizData[i].question,
        'correct_answer': quizData[i].answer[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = quizData.length;
    final numCorrectQestions = summaryData.where((item) {
      return item['correct_answer'] == item['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you answerd $numCorrectQestions out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //QuestionsSummary(getSummaryData()),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 50,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
              ),
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

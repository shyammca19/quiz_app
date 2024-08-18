import 'package:flutter/material.dart';
import 'package:demo_app2/answers_button.dart';
import 'package:demo_app2/data/quiz_data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onselectAnswer});
  final void Function(String answer) onselectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  // void answerQuestion() {
  //   setState(() {
  //     // currentQurestioIndex = currentQurestioIndex + 1;
  //     // currentQurestioIndex += 1;
  //     currentQuestionIndex++;
  //   });
  // }

  void answerQuestion(String selectedAnswer) {
    widget.onselectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuizData = quizData[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuizData.question,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 202, 154, 241),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ), //const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // ...currentQuizData.answer.map((item) {
            //   return AnswersButton(answer: item, onTab: () {});
            // }),
            ...currentQuizData.getSuffledAnswers().map((item) {
              return AnswersButton(
                  answer: item,
                  //onTab: answerQuestion);
                  onTab: () {
                    answerQuestion(item);
                  });
            }),
          ],
        ),
      ),
    );
  }
}

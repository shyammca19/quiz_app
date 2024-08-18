import 'package:flutter/material.dart';
import 'package:demo_app2/start_screen.dart';
import 'package:demo_app2/questions_screen.dart';
import 'package:demo_app2/data/quiz_data.dart';
import 'package:demo_app2/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
      //activeScreen = const QuestionsScreen();
      selectedAnswers = [];
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == quizData.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      //screenWidget = const QuestionsScreen();
      screenWidget = QuestionsScreen(onselectAnswer: selectAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: switchScreen,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 59, 16, 134),
                Color.fromARGB(255, 121, 31, 189),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          // activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionsScreen(),
          //activeScreen,
        ),
      ),
    );
  }
}

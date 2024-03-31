import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';

class Quiz extends StatefulWidget {
  // constructor dari Quiz
  const Quiz({super.key});

  // method yang harus ada dari class turunan StatefulWidget
  // nama method createState()
  // outputnya adalah bertipe data array State<Quiz>
  // returnnya adalah class _QuizState()
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}


// class _QuizState()
class _QuizState extends State<Quiz> {
  // variabel activeScreen => String
  // dan default value adalah start-screen
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    // parameter inputnya adalah method switchScreen
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
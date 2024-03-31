import 'package:flutter/material.dart';
import 'package:quiz_dasar/question_screen.dart';
import 'package:quiz_dasar/start_screen.dart';

class Quiz extends StatefulWidget {
  // konstraktor --> membuat objek Quiz dengan memanggil method Quiz()
  // nama method adalah Quiz() nama class nya Quiz --> Quiz() --> constructor
  const Quiz({super.key});

  // di dalam statefulwidget --> tidak menggunakan build tapi createState
  // State<array dari Quiz> buat method createState() return atau output
  // adalah class _QuizState
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(context) {
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
          child: const QuestionsScreen(),
        ),
      ),
    );
  }
}
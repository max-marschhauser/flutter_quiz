import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
// 1.način, u varijablu se spremi cijeli widget pa se njega prebacuje uokolo
/*
Widget?
      activeScreen; // kreiranje varijable s tipom widget, a upitnik govori da je u prvom trenutku null, ali kasnije postate widget

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    // var se zamjeni s Widget da bi tip varijable postao Widget
    // ovdje je prikazan i prop drilling (tu se to zove State Lifting), u zagradi se šalje switchScreen funckija
    super.initState();
  }


  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  */

// 2.način, u varijablu se spremi nekakav identifikator npr. string ili broj
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
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
          //child: activeScreen, // 1. način
          /*child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : const QuestionsScreen(), // 2. način
              */
          child: screenWidget,
        ),
      ),
    );
  }
}

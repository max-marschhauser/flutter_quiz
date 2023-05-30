import 'package:flutter/material.dart';
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

  @override
  Widget build(context) {
    // poslije return ide sadržaj, a gore je konfiguracija statea
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
          child: activeScreen,
        ),
      ),
    );
  }
}

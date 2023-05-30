import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,
      {super.key}); // this.startQuiz je pozicionalni argument koji je prešao iz quiz.dart za mijenjanje ekrana (state lifting, prop drilling)

  final void Function() startQuiz; // prop drilling, state lifting

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize
          .min, // vertikalno centriranje --> Column neće uzeti cijelu visinu ekrana kako je po dafaultu, već samo veličinu predmeta unutar njega
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 80),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
              'Start Quiz'), // zbog icon u nazivu ovdje ne može biti text, već mora biti label
        )
      ],
    ));
  }
}

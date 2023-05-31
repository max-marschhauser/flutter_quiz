import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer_button.dart';
import 'package:flutter_quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double
          .infinity, // iskoristi maksimalnu širinu, koliko god ima na ekranu
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // space between, space evenly... kao flex
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 30),
          ...currentQuestion.answers.map((answer) {
            // tri točke su spread operator
            return AnswerButton(
              answerText: answer,
              onTap: () {},
            ); // ovako bih importao kad su named argumenti, tada nije bitan redosljed navođenja argumenata
            //  AnswerButton('Answer text...', () {}), // ovako bih importao kad su pozicionalni argumenti
          })
        ],
      ),
    );
  }
}

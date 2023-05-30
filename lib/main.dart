import 'package:flutter/material.dart';

void main() {
  void pressedButton() {}

  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 72, 29, 80),
                Color.fromARGB(255, 108, 34, 121)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 250,
                ),
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'Learn Flutter the fun way!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                OutlinedButton(
                  onPressed: pressedButton,
                  child: const Text(
                    'Start quiz',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

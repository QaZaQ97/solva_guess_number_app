import 'package:flutter/material.dart';

class OnbordingTextWidget extends StatelessWidget {
  const OnbordingTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Добро пожаловать в игру',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        Text(
          '"Guess number"',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Что бы начать игру заполните пустые поля',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

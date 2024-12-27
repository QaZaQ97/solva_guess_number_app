import 'package:flutter/material.dart';
import 'package:solva_guess_number_app/presentation/onbording_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const OnbordingScreen(),
    );
  }
}

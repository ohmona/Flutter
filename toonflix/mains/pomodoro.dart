import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xFFE7626C),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xFF232B44),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: HomeScreen(),
    );
  }
}

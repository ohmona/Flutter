import 'package:flutter/material.dart';
import 'package:tunaflix/screens/home_screen.dart';
import 'package:tunaflix/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // every widgets have a key like ID

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

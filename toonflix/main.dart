import 'package:flutter/material.dart';
import 'mains/clock.dart';
import 'mains/paypal.dart';
import 'mains/counter.dart';
import 'mains/pomodoro.dart';

void main() {
  //runApp(App());
  //runApp(Clock());
  //runApp(Counter());
  runApp(PomodoroApp());
}

class Player {
  String name;

  Player({required this.name});
}


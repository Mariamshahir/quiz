import 'package:flutter/material.dart';
import 'package:quiz/project_1.dart';
import 'package:quiz/project_2.dart';
import 'package:quiz/project_3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz",
      debugShowCheckedModeBanner: false,
      routes: {
        Moody.routeName: (_) => Moody(),
        Workout.routeName: (_) => Workout(),
        AliceCare.routeName: (_) => AliceCare(),
      },
      initialRoute: Moody.routeName,
    );
  }
}

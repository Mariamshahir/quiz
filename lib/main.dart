
import 'package:flutter/material.dart';
import 'package:quiz/project_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz",
      initialRoute: Moody.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        Moody.routeName: (_) => Moody(),
      },
    );
  }
}

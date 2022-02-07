import 'package:flutter/material.dart';

import 'app_screens/home.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exploring UI Widgets",
      home: Home(),
    );
  }
}

import 'package:flutter/material.dart';
import 'app_screens/first_screens.dart';

void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Flutter App",
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App Screen'),
        ),
        body: FirstScreen(),
      ),
    );
  }
}

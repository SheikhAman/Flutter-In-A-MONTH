import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 300,
        // margin: EdgeInsets.only(top: 40, left: 50),
        // padding: EdgeInsets.all(20),
        color: Colors.teal,
        child: Text('Container', textDirection: TextDirection.ltr),
        alignment: Alignment.topCenter,
      ),
    );
  }
}

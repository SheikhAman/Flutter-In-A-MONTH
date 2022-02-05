import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 100,
        // width: 500,
        // margin: EdgeInsets.only(top: 40, left: 50),
        // padding: EdgeInsets.all(20),
        color: Colors.teal,
        child: Text(
          'Container',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 40.0,
            fontFamily: 'HindMadurai',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

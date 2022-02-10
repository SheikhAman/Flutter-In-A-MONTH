import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Stateful App Example',
      home: FavoriteCountry(),
    ),
  );
}

// Class that inherit StatefulWidget are immutable. But, the State is mutable
class FavoriteCountry extends StatefulWidget {
  const FavoriteCountry({Key? key}) : super(key: key);

  @override
  _FavoriteCountryState createState() => _FavoriteCountryState();
}

class _FavoriteCountryState extends State<FavoriteCountry> {
  String nameCity = '';
  @override
  Widget build(BuildContext context) {
    debugPrint('FavoriteCountry widget is created');
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful App Example'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onSubmitted: (String userInput) {
                setState(() {
                  debugPrint(
                      'SetState is called, this tells framework to redraw the FavoriteCountry widget');
                  nameCity = userInput;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Your favorite country $nameCity',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

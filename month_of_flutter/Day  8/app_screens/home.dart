import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 40),
        color: Colors.teal,
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Flying Jet',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35.0,
                      fontFamily: 'HindMadurai',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'From Dhaka to Saidpur via Nowakhali',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'HindMadurai',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Air Bangladesh',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35.0,
                      fontFamily: 'HindMadurai',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'From Dhaka to Saidpur',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'HindMadurai',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: CustomImage()),
          ],
        ),
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/github.jpg');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
    );
  }
}

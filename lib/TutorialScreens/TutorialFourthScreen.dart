import 'package:flutter/material.dart';
import 'package:todo_task/Util/Constants.dart';

/* Custom widget for tutorial fourth screen that contains text and image */
class TutorialFourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: Container(
        margin: EdgeInsets.only(
            top: kTopPadding, left: kSidePadding, right: kSidePadding),
        child: Column(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: kTextFontSize, color: Colors.black),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Pinch together vertically ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'to collapse your current level and navigate up.'),
                ],
              ),
            ),
            SizedBox(
              height: kTopPadding + 30,
            ),
            Image.asset('assets/images/img.png'),
          ],
        ),
      ),
    );
  }
}

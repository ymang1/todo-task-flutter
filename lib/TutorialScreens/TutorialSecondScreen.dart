import 'package:flutter/material.dart';
import 'package:todo_task/Util/Constants.dart';
import 'package:todo_task/Widgets/TextWidget.dart';

/* Custom widget for tutorial second screen that contains text and image */
class TutorialSecondScreen extends StatelessWidget {
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
                      text: 'Tap and hold ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'to pick an item up.'),
                ],
              ),
            ),
            SizedBox(
              height: kNewLineFontSize,
            ),
            TextWidget(text: 'Drag it up or down to change its priority.'),
            SizedBox(
              height: kTopPadding + 20,
            ),
            Expanded(
              child: Image.asset('assets/images/img.png'),
            ),
          ],
        ),
      ),
    );
  }
}

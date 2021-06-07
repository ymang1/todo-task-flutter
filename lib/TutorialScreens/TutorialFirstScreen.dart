import 'package:flutter/material.dart';
import 'package:todo_task/Util/Constants.dart';
import 'package:todo_task/Widgets/TextWidget.dart';

/* Custom widget for tutorial first screen that contains text and image */
class TutorialFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height/2;
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
                text: 'Clear sort items by ',
                style: TextStyle(fontSize: kTextFontSize, color: Colors.black),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'priority.',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              height: kNewLineFontSize,
            ),
            TextWidget(text: 'Important items are highlighted at the top....'),
            SizedBox(
              height: kTopPadding + 30,
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

import 'package:flutter/material.dart';
import 'package:todo_task/Util/Constants.dart';
import 'package:todo_task/Widgets/TextWidget.dart';

/* Custom widget for tutorial third screen that contains text and image */
class TutorialThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: Container(
        margin: EdgeInsets.only(
            top: kTopPadding, left: kSidePadding, right: kSidePadding),
        child: Column(
          children: <Widget>[
            TextWidget(text: 'There are three navigation levels...'),
            SizedBox(
              height: kTopPadding + 70,
            ),
            Image.asset('assets/images/img.png'),
          ],
        ),
      ),
    );
  }
}

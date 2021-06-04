import 'package:flutter/material.dart';
import 'package:todo_task/Util/Constants.dart';
import 'package:todo_task/Widgets/ButtonWidget.dart';
import 'package:todo_task/Widgets/TextWidget.dart';
import 'SignUpScreen.dart';

/* Custom widget for iCloud Permission access screen that contains image, text and buttons */
class CloudAccessPermissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) => _onHorizontalDrag(details, context),
      child: Scaffold(
        backgroundColor: Colors.brown.shade50,
        body: Container(
          margin: EdgeInsets.only(
              top: 50, left: kSidePadding, right: kSidePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/cloud.png'),
              SizedBox(
                height: 50,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 40, color: Colors.black),
                  children: const <TextSpan>[
                    TextSpan(text: 'Use '),
                    TextSpan(
                        text: 'iCloud',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '?'),
                  ],
                ),
              ),
              SizedBox(
                height: kNewLineFontSize,
              ),
              TextWidget(
                  text:
                  'Storing your lists in iCloud allows you to keep your data in sync across your iPhone, iPad and Mac.'),
              SizedBox(
                height: kNewLineFontSize * 2,
              ),
              HorizontalButtonWidget(
                firstButtonTitle: 'Not Now',
                secondButtonTitle: 'Use iCloud',
                padding: EdgeInsets.all(15),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* Navigate to sign-up screen when user drag horizontally */
  void _onHorizontalDrag(DragEndDetails details, BuildContext context) {
    if(details.primaryVelocity == 0) return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity!.compareTo(0) == -1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
    } else {
      Navigator.pop(context);
    }
  }
}

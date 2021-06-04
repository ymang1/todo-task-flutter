import 'package:flutter/material.dart';
import 'package:todo_task/Screens/CloudAccessPermissionScreen.dart';
import 'package:todo_task/Util/Constants.dart';

/* Custom widget for tutorial fifth screen that contains gesture, text and image */
class TutorialFifthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) => _onHorizontalDrag(details, context),
      child: Scaffold(
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
                        text: 'Tap on a list ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'to see its content.'),
                  ],
                ),
              ),
              SizedBox(
                height: kNewLineFontSize,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: kTextFontSize, color: Colors.black),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Tap on a list title ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'to edit it....'),
                  ],
                ),
              ),
              SizedBox(
                height: kTopPadding + 40,
              ),
              Image.asset('assets/images/img.png'),
            ],
          ),
        ),
      ),
    );
  }

  /* Navigate to cloud access permission screen when user drag horizontally */
  void _onHorizontalDrag(DragEndDetails details, BuildContext context) {
    if(details.primaryVelocity == 0) return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity!.compareTo(0) == -1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CloudAccessPermissionScreen()));
    }
  }
}

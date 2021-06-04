import 'package:flutter/material.dart';
import 'package:todo_task/Util/Constants.dart';
import 'package:todo_task/Widgets/ButtonWidget.dart';
import 'package:todo_task/Widgets/TextWidget.dart';
import '../ToDoListView.dart';

/* Custom widget for sign-up screen that contains text, image and text input field */
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) =>
          _onHorizontalDrag(details, context),
      child: Scaffold(
        backgroundColor: Colors.brown.shade50,
        body: Container(
          margin:
              EdgeInsets.only(top: 50, left: kSidePadding, right: kSidePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextWidget(
                  text:
                      'Sign up to the newsletter, and unlock a theme for your lists.'),
              SizedBox(
                height: 0,
              ),
              Image.asset('assets/images/email.png'),
              SizedBox(
                height: 30,
              ),
              getTextInputField(context),
              SizedBox(
                height: kNewLineFontSize * 2,
              ),
              HorizontalButtonWidget(
                firstButtonTitle: 'Skip',
                secondButtonTitle: 'Join',
                padding:
                    EdgeInsets.only(top: 10, left: 30, bottom: 10, right: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Get Text Input Field
  Padding getTextInputField(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    var style = const TextStyle(fontSize: kTextFontSize);
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        controller: textEditingController,
        style: style,
        enabled: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabled: true,
          hintText: 'Email Address',
          hintStyle: style,
          fillColor: Colors.white54,
        ),
      ),
    );
  }

  /* Navigate to cloud access permission screen when user drag horizontally */
  void _onHorizontalDrag(DragEndDetails details, BuildContext context) {
    if (details.primaryVelocity == 0)
      return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity!.compareTo(0) == -1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ToDoListView()));
    } else {
      Navigator.pop(context);
    }
  }
}

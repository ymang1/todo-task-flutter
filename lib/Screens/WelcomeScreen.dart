import 'package:flutter/material.dart';
import 'package:todo_task/Util/Constants.dart';
import '../PageView.dart';

/* Custom widget for welcome page that contains texts */
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) => _onHorizontalDrag(details, context),
      onTap: () => navigateToPageView(context),
      child: Scaffold(
        backgroundColor: Colors.brown.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Clear',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(
                height: kNewLineFontSize,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: kTextFontSize, color: Colors.black),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Tap or swipe ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'to begin.')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* Navigate to page view when user drag horizontally */
  void _onHorizontalDrag(DragEndDetails details, BuildContext context) {
    if(details.primaryVelocity == 0) return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity!.compareTo(0) == -1) {
      navigateToPageView(context);
    }
  }

  /* Navigate to page view when user tap on screen */
  void navigateToPageView(BuildContext context) {
    /// initiate page with zero index
    final PageController controller = PageController(initialPage: 0);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageView(controller: controller)));
  }
}

import 'package:flutter/material.dart';
import 'TutorialScreens/TutorialFifthScreen.dart';
import 'TutorialScreens/TutorialFirstScreen.dart';
import 'TutorialScreens/TutorialFourthScreen.dart';
import 'TutorialScreens/TutorialSecondScreen.dart';
import 'TutorialScreens/TutorialThirdScreen.dart';
import 'Util/Constants.dart';
import 'Widgets/DotsIndicator.dart';

/*
Custom widget for page view
 - controller: page controller reference
 */
class MyPageView extends StatelessWidget {
  final PageController controller;
  MyPageView({required this.controller});

  /// array list of pages
  final List<Widget> pages = <Widget>[
    TutorialFirstScreen(),
    TutorialSecondScreen(),
    TutorialThirdScreen(),
    TutorialFourthScreen(),
    TutorialFifthScreen(),
  ];

  /// constant for animation duration
  static const _kDuration = const Duration(milliseconds: 300);

  /// constant for curve
  static const _kCurve = Curves.ease;

/* Custom widget return stack of page view and dot indicator */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: pages.length,
            controller: controller,
            itemBuilder: (BuildContext context, int index) {
              return pages[index % pages.length];
            },
          ),
          Positioned(
            left: kSidePadding,
            right: kSidePadding,
            top: MediaQuery.of(context).size.height/3,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(20),
              child: Center(
                child: DotsIndicator(
                  controller: controller,
                  itemCount: pages.length,
                  onPageSelected: (int page) {
                    controller.animateToPage(page,
                        duration: _kDuration, curve: _kCurve);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
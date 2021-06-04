import 'package:flutter/material.dart';
import 'package:todo_task/Util/Constants.dart';

/*
Custom widget for Left/Right Swipe
 - icon: icon image in the background
 - iconColor: icon image color
 - mainAxisAlignment: main axis alignment of content
 - alignment: left/right alignment of icon
 */
class SwipeWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final EdgeInsets padding;
  final AlignmentDirectional alignment;
  final Color backgroundColor;

  const SwipeWidget(
      {required this.icon,
      this.iconColor = Colors.white,
      required this.padding,
      required this.alignment,
      this.backgroundColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    double iconSize = (kListCellHeight - kTextFontSize) / 2;
    return Container(
      alignment: alignment,
      color: backgroundColor,
      child: Padding(
        padding: padding,
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}

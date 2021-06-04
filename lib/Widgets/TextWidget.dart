import 'package:flutter/material.dart';
import 'package:todo_task/Util/Constants.dart';

/*
Custom widget for Text
 - text: title of text
 - alignment: alignment of text
 - textColor: color of text
 - fontSize: font size of text
 - fontWeight: font style of text
 - textDecoration: decoration style (like underline, strike and so on) of text
 */
class TextWidget extends StatelessWidget {
  final String text;
  final TextAlign alignment;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;

  const TextWidget(
      {required this.text,
      this.alignment = TextAlign.center,
      this.textColor = Colors.black,
      this.fontSize = kTextFontSize,
      this.fontWeight = FontWeight.normal,
      this.textDecoration = TextDecoration.none});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          decoration: textDecoration),
      textAlign: alignment,
    );
  }
}

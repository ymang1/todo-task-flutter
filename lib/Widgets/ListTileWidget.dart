import 'package:flutter/material.dart';
import 'package:todo_task/Util/Constants.dart';
import 'TextWidget.dart';

/*
Custom widget for List Tile in List
 - title: title of list tile
 - cellHeight: height of the list tile
 - cellBGColor: background color of the list tile
 - isCompleted: bool for the task status
 */
class ListTileWidget extends StatelessWidget {
  final String title;
  final double cellHeight;
  final Color cellBGColor;
  final bool isCompleted;

  const ListTileWidget(
      {required this.title,
      required this.cellHeight,
      required this.cellBGColor,
      this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    double cellWidth = MediaQuery.of(context).size.width;
    double topPadding = (cellHeight - kTextFontSize) / 2;
    return Container(
      height: cellHeight,
      width: cellWidth,
      color: !isCompleted ? cellBGColor : Colors.black,
      child: Padding(
        padding: EdgeInsets.only(left: 15, top: topPadding),
        child: TextWidget(
          text: title,
          alignment: TextAlign.left,
          textColor: isCompleted ? Colors.grey : Colors.white,
          fontSize: kTextFontSize,
          fontWeight: FontWeight.bold,
          textDecoration:
              isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}
